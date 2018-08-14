FROM node:carbon-alpine AS node

FROM jenkins/jenkins:lts-alpine

LABEL maintainer="acrisliu@gmail.com"

# Switch to root user
USER root

COPY --from=node /usr/local/bin/node /usr/local/bin/npm /usr/local/bin/npx \
     /usr/local/bin/
COPY --from=node /usr/local/include/node/ /usr/local/include/node/
COPY --from=node /usr/local/lib/node_modules/ /usr/local/lib/node_modules/
COPY --from=node /usr/local/share/doc/node/ /usr/local/share/doc/node/
COPY --from=node /usr/local/share/man/man1/node.1 /usr/local/share/man/man1/
COPY --from=node /usr/local/share/systemtap/tapset/node.stp /usr/local/share/systemtap/tapset/

RUN set -ex \
    apk add --no-cache libstdc++ \
    && npm install --global yarn

# Switch to jenkins user
USER jenkins
