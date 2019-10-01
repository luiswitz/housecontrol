FROM ruby:2.6.2-slim

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev cron

RUN gem install bundler
RUN gem install rails

RUN touch /var/log/cron.log

ENV INSTALL_PATH /expensescontrol

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile ./

ENV BUNDLE_PATH /box

COPY . .

CMD cron && tail -f /var/log/cron.log
