#!/bin/bash

set -e -o xtrace

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "${BASE_DIR}"

scp "wall_e_create_fixtures_json.sh" csss@jenkins.sfucsss.org:"/home/csss/create_jsons.sh"
ssh csss@jenkins.sfucsss.org "/home/csss/create_jsons.sh"
scp -r csss@jenkins.sfucsss.org:"/home/csss/wall_e.json" .
ssh csss@jenkins.sfucsss.org "rm -fr /home/csss/wall_e.json"
ssh csss@jenkins.sfucsss.org "rm /home/csss/create_jsons.sh"
mkdir -p /mnt/dev_csss_wall_e/fixtures || true
mv wall_e.json /mnt/dev_csss_wall_e/fixtures/.
