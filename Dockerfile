FROM ruby:alpine

RUN gem install --no-rdoc --no-ri concourse-fuselage
ADD resource/ /opt/resource
