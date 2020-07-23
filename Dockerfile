FROM hmlandregistry/dev_base_ruby:4.1

WORKDIR /src

ADD Gemfile* /src/
RUN bundle install


ENV AUTOMATION_TRAINING_UI 'https://automation-training.herokuapp.com'
ENV DRIVER 'chrome'

ENV BS_USERNAME 'username'
ENV BS_ACCESS_KEY 'key'
ENV BS_PROJECT 'Skeleton'
ENV BS_BUILD 'build'
ENV BS_SERVER 'hub-cloud.browserstack.com'
ENV BS_CONFIG 'win10_edge'
