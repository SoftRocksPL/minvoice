FROM ubuntu:14.04
MAINTAINER Kathy Adamska <kadamska@softrocks.pl>

COPY ./docker/web/web-entrypoint.sh /
COPY ./package.json /django/package.json

WORKDIR /django

RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb http://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y nodejs yarn
