FROM ubuntu:18.04

LABEL "com.github.actions.name"="DocFX - Build and publish documentation"
LABEL "com.github.actions.description"="Builds and publishes documentation."
LABEL "com.github.actions.icon"="code"
LABEL "com.github.actions.color"="red"

LABEL "repository"="https://github.com/carolinesena/DocFX"
LABEL "homepage"=""
LABEL "maintainer"="Caroline Sena <caroline.sena@traycorp.com.br>"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
RUN ["chmod", "+x", "/entrypoint.sh"]
