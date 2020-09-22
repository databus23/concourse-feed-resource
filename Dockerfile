FROM ruby:alpine
LABEL source_repository="https://github.com/databus23/concourse-feed-resource"

RUN gem install --no-document concourse-fuselage
ADD resource/ /opt/resource
