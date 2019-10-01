FROM ubuntu:18.04

LABEL "com.github.actions.name"="DocFX - Generate TypeScript Documentation"
LABEL "com.github.actions.description"="Generates TypeScript API documentation from an npm package."
LABEL "com.github.actions.icon"="code"
LABEL "com.github.actions.color"="red"

LABEL "repository"="https://github.com/carolinesena/DocFX"
LABEL "homepage"=""
LABEL "maintainer"="Caroline Sena <caroline.sena@traycorp.com.br>"

ENTRYPOINT ["/entrypoint.sh"]
RUN ["chmod", "+x", "/entrypoint.sh"]
