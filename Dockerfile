FROM hmlandregistry/dev_base_ruby:4.1

WORKDIR /src

ADD Gemfile* /src/
RUN bundle install

# Docker is the container so ensure the environment variables are set here (they will be set in jenkins in test environments)
# The services in docker containers can not be accessed by localhost so need their container name and port 8080 specified
ENV SERVICE_UI_DOMAIN 'http://docker-container:8080'

ENV WEB_DRIVER 'chrome'

ENV BS_USERNAME 'username'
ENV BS_ACCESS_KEY 'key'
ENV BS_PROJECT 'project'
ENV BS_BUILD 'build'
ENV BS_SERVER 'hub-cloud.browserstack.com'
ENV BS_CONFIG 'win10_edge'
