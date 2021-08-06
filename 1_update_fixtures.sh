#!/bin/bash

set -e -o xtrace


scp "0_create_fixture_jsons.sh" csss@sfucsss.org:"/home/csss/create_jsons.sh"
ssh csss@sfucsss.org "/home/csss/create_jsons.sh"
scp -r csss@sfucsss.org:"/home/csss/csss-site/*.json" .
ssh csss@sfucsss.org "rm -fr /home/csss/csss-site/*.json"
ssh csss@sfucsss.org "rm /home/csss/create_jsons.sh"

mkdir ~/fixtures
mv about.json ~/fixtures/.
python3 ./update_confidential_info.py
mv auth.json ~/fixtures/.
mv announcements.json ~/fixtures/.
mv django_mailbox.json ~/fixtures/.
mv elections.json ~/fixtures/.
mv resource_management.json ~/fixtures/.
