FROM ruby:2.4.1

RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev nodejs


ENV APP_HOME /www
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ENV BUNDLE_PATH /box
ADD . $APP_HOME


RUN apt-get install -y python python-dev python-pip
RUN pip install awscli


EXPOSE 4000