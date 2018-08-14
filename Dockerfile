FROM node:carbon-alpine AS node

FROM jenkins/jenkins:lts-alpine

LABEL maintainer="acrisliu@gmail.com"

# Switch to root user
USER root

RUN --mount=src=/,dest=/,from=node \
    apk add --no-cache libstdc++ \
    && mv /usr/local/bin/node cp /usr/local/bin/npm cp /usr/local/bin/npx \
          /usr/local/bin/yarn /usr/local/bin/yarnpkg \
          /usr/local/bin/ \
    && mv /usr/local/include/node/ /usr/local/include/ \
    && mv /usr/local/lib/node_modules/ /usr/local/lib/ \
    && mv /usr/local/share/ /usr/local/

# Switch to jenkins user
USER jenkins
