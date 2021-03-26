![Ruby](https://github.com/LandRegistry/skeleton-acceptance-tests/workflows/Ruby/badge.svg?branch=main)
# Skeleton Acceptance Tests

This repository is a skeleton to run Cucumber acceptance tests (with [Ruby][1] and [Selenium][2]), as part of the Land Registry [common-dev-env][3].
This skeleton includes sample tests written to the HMLR UI Test Standard (Page Object Model pattern).
The [wiki][13] contains more detailed information on the rules and examples.

The tests are written against a test service, built with the [GOV.UK prototype kit][11] hosted on heroku. The [training service][10] has basic functionality and common components found in GOV.UK services.
The training service code is hosted on [github][12], and open to contributions.

## Notes

* The gems used for the acceptance tests are contained within the `Gemfile`
* The `Gemfile.lock` provided contains working gem dependencies.
* [Ruby Style Guide][4] will provide examples and explanations for linting violations
* The [docker-base-image v4.1][5] is used to build this skeleton and currently uses:
    * Ruby version: 2.6.5
    * Rubygems version: 3.0.6
    * Bundler version: 2.0.2
* `support/config.rb` has the skeleton default values and driver configuration

## Architecture
The skeleton is composed of a few different technologies.

The key technologies used are:

* [Cucumber][8]
* [Ruby][1]
* [Selenium webdriver][2]
* [Capybara][6]
* [Chromedriver][7]


![Acceptance test flow](reference_docs/skeleton_architecture.png)


*High level acceptance test architecture diagram*

### Description

Cucumber feature files (business facing) are written in the english like Gherkin syntax.
These link to the step definitions (technical facing), written in Ruby.


When executed, the Ruby code triggers Capybara actions to interact with the page.
Capybara acts as a wrapper around Selenium (which really triggers the page interactions).
Capybara uses acceptance test type language, and is driver agnostic, so you could choose a different webdriver.

    # Cabybara example
    fill_in('some_field', with: 'some_text')

    # Selenium example
    driver.findElement(By.id('some_field').sendKeys('some_text'))


Selenium talks to Chromedriver which allows automation of a Chrome browser session.
The actions are performed against the web application under test.

The tests are run using headless chrome (you cannot see the browser open, and the tests running)


## Adding the skeleton to an existing dev-env
If you are already familiar with the [common-dev-env][3] and have an existing dev-env-config
you can add the skeleton into your`configuration.yml`.

```yaml
  skeleton-acceptance-tests:
    repo: git@github.com:LandRegistry/skeleton-acceptance-tests.git
    branch: master
```

## To Run the tests
* Firstly confirm commands listed below correspond to whats provided in the
[Common dev-env][3].
But defer to the dev-env documentation as the source of truth, in the event of conflicting information.


```shell
# Use common-dev-env alias to execute run_tests.sh within the docker container
acctest skeleton-acceptance-tests
```

```shell
# or use the full command without the common-dev-env alias
docker-compose run --rm skeleton-acceptance-tests sh run_tests.sh
```

 ```shell
# To run only tests with specific tags:
acctest skeleton-acceptance-tests --tags "@run_me"
```
 ```shell
# To exclude tests based on tags use "not"
acctest skeleton-acceptance-tests --tags "not @dont_run_me"
```

```shell
# This can be comibined to run some tags, while excluding others
acctest skeleton-acceptance-tests --tags "@included_tag and not @excluded_tag"
```

## Rubocop
* The configuration of Rubocop and any future configuration can be done in:
  `.rubocop.yml`. Check the `TargetRubyVersion` matches what is running in your environment

* A Rubocop evaluation of the Ruby code must be done during development, with violations resolved

* A standalone run of Rubocop can be done with the following commands:

```shell
# Use common-dev-env alias to execute run_linting.sh within the docker container
acclint skeleton-acceptance-tests
```
which is equivalent to

```shell
run skeleton-acceptance-tests sh run_linting.sh
```

Rubocop can attempt to automatically fix any linting issues in your code using the flag `-a`.
```shell
run skeleton-acceptance-tests rubocop -a
```

It's better to use this at file or folder level, rather than suite level.
Rubocop can be used to lint a single file, rather than the whole codebase

```shell
run skeleton-acceptance-tests rubocop -a {path to your code}
```

## Automated Accessibility Checks (Axe)

Some automated accessibility checks, can be performed using the axe-matchers gem.
These checks will ***not prove a page is accessible***. Manual checks must still be performed.

Do not add axe checks as part of other tests. Tests should be atomic.
Axe tests should be separate from other acceptance tests.
Examples can be found in `features/features/accessibility.feature`

To check a page do the following:

1. Tag the scenario with `@axe`
This scenario should only navigate to the page you want to test, and get it into the correct state.

2. Once on the page use this step to run axe
` Then the page should be accessible according to: wcag2aa`

3. Run all tests tagged with `@axe`
You can use any the standard dev-env methods to do this.

e.g. `acctest skeleton-acceptance-tests --tags @axe`

## BrowserStack
Tests can be run remotely on BrowserStack servers as part of your testing.
This has added BrowserStack environment variables `BS_*` in the `Dockerfile`, which will need credentials.
The full list of what we must test against can be found in [GDS Compatability](https://www.gov.uk/service-manual/technology/designing-for-different-browsers-and-devices),
and are documented in the provided Desktop configurations `/browser_configs` folder.

Test runs can be checked by logging into [Browserstack dashboard](https://automate.browserstack.com/) looking in the project you've specified.
Here you can view the video of the test, and review the logs.

There are 2 main ways to use this functionality:

-  The Shell script
-  Change the web driver used in the tests

BrowserStack configuration information is found in `features/support/config_browserstack.rb`.

### BrowserStack shell script
The `run_browserstack.sh` shell script will run all scenarios tagged with `@browser` against all the browser configurations
listed in the script. See `/browser_configs` for more details.

It will also out put a `report_[config_name].json` file for each run configuration, which can be used to determine pass/fails.

The script can be called with:
```shell
run skeleton-acceptance-tests ./run_browserstack.sh
```

It's aimed to provide a simple way to run tagged scenarios through different configurations.

### Change the default webdriver
The `DRIVER` environment variable is referred to by the Capybara configuration in `features/support/config.rb`.
The default value is `chrome`, which will use the headless chrome configuration( `:chrome`) provided with the skeleton.

To change this default, change your Dockerfile entry to read `ENV DRIVER 'browserstack'`, and rebuild the container.
This will use the driver `:browserstack` configuration in `features/support/config_browserstack.rb`.
If you want to change browser configurations you will need to amend `BS_CONFIG` to another file from the `/browser_configs` folder too.

You can now run tests against BrowserStack remote devices using the standard `acctest` alias.

Example
```shell
# Dockerfile changes
ENV DRIVER 'browserstack'
ENV BS_PROJECT 'Skeleton'
ENV BS_BUILD '001'
ENV BS_CONFIG 'mac_safari12'

# rebuild container to apply changes
rebuild skeleton-acceptance-tests

# Run my tests against browserstack
acctest skeleton-acceptance-tests --tags @safari_example
Console  messages ...
```

The test run results will be shown in `report.json` as usual.
The BrowserStack dashboard will show the test run under the `Skeleton` project.
All scenarios tagged with `@safari_example` will have run against `browser_configs/macos_safari12.config.yml`


## Universal dev-env support

Provided via configuration.yml, Dockerfile and fragments/docker-compose-fragment.yml.
configuration.yml lists the commodities the dev env needs to spin. NGINX may be used for the applications
The docker-compose-fragment.yml contains the service definition. The names will need modifying.
The Dockerfile simply sets the APP_NAME environment variable and installs the dependencies. Any specific variables or commands can be added here.

## support/env.rb file

This file contains the global variables that are obtained from the environment variables specified in the Dockerfile or exported from Jenkins

## support/config.rb

This details the configuration of ruby. Any libraries used must be required here. If function libraries are added to the lib-rb folder then the relative path must be added here

[1]: https://www.ruby-lang.org/en
[2]: https://www.seleniumhq.org/projects/webdriver/
[3]: https://github.com/LandRegistry/common-dev-env
[4]: https://github.com/rubocop-hq/ruby-style-guide
[5]: https://github.com/LandRegistry/docker-base-images/blob/master/dev_base_ruby/4.1/Dockerfile
[6]: https://github.com/teamcapybara/capybara
[7]: http://chromedriver.chromium.org/
[8]: https://cucumber.io/docs
[9]: https://github.com/aaronFlynn/acctest-dev-env-config
[10]: https://automation-training.herokuapp.com/
[11]: https://govuk-prototype-kit.herokuapp.com/docs
[12]: https://github.com/flynnbops/automation-training
[13]: https://github.com/LandRegistry/skeleton-acceptance-tests/wiki

