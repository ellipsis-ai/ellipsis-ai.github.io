FROM ruby:2.4.1

RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev nodejs


# Install program to configure locales
RUN apt-get install -y locales
RUN dpkg-reconfigure locales && \
  locale-gen C.UTF-8 && \
  /usr/sbin/update-locale LANG=C.UTF-8

# Install needed default locale for Makefly
RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && \
  locale-gen

# Set default locale for the environment
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

ENV APP_HOME /www
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ENV BUNDLE_PATH /box
ADD . $APP_HOME


RUN apt-get install -y python python-dev python-pip
RUN pip install awscli

EXPOSE 4000
