FROM ubuntu:14.04
MAINTAINER Zaiste <oh [at] zaiste.net>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev

ADD https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.3.tar.gz /tmp

RUN cd /tmp && \
    cd ruby-2.2.3 && \
    ./configure --disable-install-doc && \
    make && \
    make install && \
    cd .. && \
    rm -rf ruby-2.2.3

RUN gem install bundler --no-rdoc --no-ri
