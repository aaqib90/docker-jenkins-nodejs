FROM node:alpine AS node

FROM jenkins/jenkins:alpine

LABEL maintainer="acrisliu@gmail.com"

# Switch to root user
USER root

RUN --mount=src=/,dest=/,from=node \
    apk add --no-cache libstdc++

COPY /usr/local/bin/node /usr/local/bin/npm /usr/local/bin/npx \
     /usr/local/bin/yarn /usr/local/bin/yarnpkg \
     /usr/local/bin/
COPY /usr/local/include/node/ /usr/local/include/
COPY /usr/local/lib/node_modules/ /usr/local/lib/
COPY /usr/local/share/ /usr/local/

# Switch to jenkins user
USER jenkins
