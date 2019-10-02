FROM ubuntu:18.04

LABEL "com.github.actions.name"="DocFX - Push changes to Github"
LABEL "com.github.actions.description"="Pushes build changes to Github"
LABEL "com.github.actions.icon"="code"
LABEL "com.github.actions.color"="red"

LABEL "repository"="https://github.com/carolinesena/DocFX"
LABEL "homepage"=""
LABEL "maintainer"="Caroline Sena <caroline.sena@traycorp.com.br>"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
RUN ["chmod", "+x", "./actions/push/entrypoint.sh"]
