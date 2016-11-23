#!/bin/bash
set -e

if [ "$1" = 'dnsseed-611' ]; then
	mkdir -p "$SIXELEVEN_DATA"
	cd "$SIXELEVEN_DATA"

	ARGS="-h ${SEED_HOSTNAME:-$HOSTNAME.local} -n ${NAMESERVER_HOSTNAME:-$HOSTNAME.local} -m ${EMAIL:-sorry@does.not.exist} -t ${CRAWLER_THREADS:-96} -d ${NAMESERVER_THREADS:-4} -p ${SEED_PORT:-53} ${OPTS:-}"

	exec "$@" $ARGS
fi

exec "$@"
