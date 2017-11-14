# Jenkins with Node.js Dockerfile
This Dockerfile build an image for [Jenkins](https://jenkins.io/) with [Node.js](https://nodejs.org/) and [Yarn](https://yarnpkg.com/), based on Alpine Linux.

Current version:
- Jenkins: 2.73.3
- Node.js: 8.9.1
- Yarn: 1.3.2

![Jenkins](http://jenkins-ci.org/sites/default/files/jenkins_logo.png "Jenkins")  

## Quick Start

```
docker run -p 8080:8080 -p 50000:50000 acrisliu/jenkins-nodejs
```

NOTE: read below the _build executors_ part for the role of the `50000` port mapping.

This will store the workspace in /var/jenkins_home. All Jenkins data lives in there - including plugins and configuration.
You will probably want to make that an explicit volume so you can manage it and attach to another container for upgrades :

```
docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home acrisliu/jenkins-nodejs
```

this will automatically create a 'jenkins_home' volume on docker host, that will survive container stop/restart/deletion. 

Avoid using a bind mount from a folder on host into `/var/jenkins_home`, as this might result in file permission issue. If you _really_ need to bind mount jenkins_home, ensure that directory on host is accessible by the jenkins user in container (jenkins user - uid 1000) or use `-u some_other_user` parameter with `docker run`.

---

Read [Jenkins documentation](https://github.com/jenkinsci/docker/blob/alpine/README.md) for more usages, don't forget replace "jenkins" to "acrisliu/jenkins-nodejs".
