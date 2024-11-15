#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

set -a
source "${SCRIPT_DIR}/.env"
set +a

URL='https://docs.paloaltonetworks.com/compatibility-matrix/globalprotect/where-can-i-install-the-globalprotect-app'
KEYWORD='sequoia'
NTFY_SERVER='https://ntfy.542646.xyz'
NTFY_TOPIC='paloalto'

function notify {
	curl -u :tk_1dhk6g338j3c1n69hhooe48f2l966 -d "Mentioned the keyword $1" ${NTFY_SERVER}/${NTFY_TOPIC}
}

if curl -sL "$URL" | grep -qi "$KEYWORD"; then
    echo "Keyword '$KEYWORD' found"
    notify "$KEYWORD"
fi
