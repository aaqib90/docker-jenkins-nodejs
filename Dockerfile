FROM node:alpine AS node

FROM jenkins/jenkins:alpine

LABEL maintainer="acrisliu@gmail.com"

# Switch to root user
USER root

RUN apk add --no-cache libstdc++

COPY --from=node /usr/local/bin/node /usr/local/bin/npm /usr/local/bin/npx \
     /usr/local/bin/yarn /usr/local/bin/yarnpkg \
     /usr/local/bin/
COPY --from=node /usr/local/include/node/ /usr/local/include/
COPY --from=node /usr/local/lib/node_modules/ /usr/local/lib/
COPY --from=node /usr/local/share/ /usr/local/

# Switch to jenkins user
USER jenkins
