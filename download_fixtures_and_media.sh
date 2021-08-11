#!/bin/bash

set -e -o xtrace

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "${BASE_DIR}"

scp "create_fixture_jsons.sh" csss@sfucsss.org:"/home/csss/create_jsons.sh"
ssh csss@sfucsss.org "/home/csss/create_jsons.sh"
scp -r csss@sfucsss.org:"/home/csss/csss-site/*.json" .
ssh csss@sfucsss.org "rm -fr /home/csss/csss-site/*.json"
ssh csss@sfucsss.org "rm /home/csss/create_jsons.sh"

mkdir  ~/fixtures || true
python3 ./redact_confidential_info.py
mv about.json ~/fixtures/.
mv auth.json ~/fixtures/.
mv announcements.json ~/fixtures/.
mv django_mailbox.json ~/fixtures/.
mv elections.json ~/fixtures/.
mv resource_management.json ~/fixtures/.

scp -r csss@sfucsss.org:"/home/csss/media_root/mailbox_attachments" ~/.

rm -fr /mnt/dev_csss_website_media/exec-photos

scp -r csss@sfucsss.org:"/home/csss/static_root/about_static/exec-photos" /mnt/dev_csss_website_media/.

rm -fr /mnt/dev_csss_website_media/*.git
