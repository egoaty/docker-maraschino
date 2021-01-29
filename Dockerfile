ARG DISTRO=alpine:3
FROM $DISTRO

ARG RELEASE_VERSION=""
ARG GITHUB_CLONE_URL="https://github.com/mrkipling/maraschino.git"
ARG APP_ROOT="/opt/maraschino"

RUN \
  apk add --no-cache curl jq python2 && \
  apk add --no-cache git && \
  mkdir -p "$APP_ROOT" && \
  git clone "${GITHUB_CLONE_URL}" "${APP_ROOT}" && \
  apk del --purge -r git
  
COPY root/ /

VOLUME ["/config"]
EXPOSE 7000/tcp

CMD /run.sh

