#!/bin/sh
##
## Run the daemon (Maraschino)
##
## Environment Variables:
##  PUID    ... unprivileged UID
##  PGID    ... unprivileged GID
##  WEBROOT ... URL path for application root (e.g. /maraschino)
##

user="web"
group="web"
if ! id ${user} >/dev/null 2>&1; then 
	addgroup -g "${PGID:=100000}" "${group}"
	adduser -h / -H -D -G "${group}" -u "${PUID:=100000}" "${user}"
fi

chown -R ${user}:${group} /config

[ -n "${WEBROOT}" ] && DAEMON_OPTS="${DAEMON_OPTS} --webroot=$WEBROOT"

# Run Maraschino in foreground
runcmd="cd /opt/maraschino && python2 Maraschino.py --datadir=/config --database=/config/maraschino.db ${DAEMON_OPTS}"
su -c "$runcmd" - ${user} 

