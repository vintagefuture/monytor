#!/bin/bash

set -a
source ./.env
set +a

URL='https://docs.paloaltonetworks.com/compatibility-matrix/globalprotect/where-can-i-install-the-globalprotect-app'
KEYWORD='sonoma'
NTFY_SERVER='https://ntfy.542646.xyz'
NTFY_TOPIC='paloalto'

function notify {
	curl -u ${NTFY_USER}:${NTFY_PWD} -d "Mentioned the keyword $1" ${NTFY_SERVER}/${NTFY_TOPIC}
}

if curl -s "$URL" | grep -qi "$KEYWORD"; then
    echo "Keyword '$KEYWORD' found"
    notify "$KEYWORD"
fi
