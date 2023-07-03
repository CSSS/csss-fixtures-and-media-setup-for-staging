#!/bin/bash

set -e -o xtrace

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "${BASE_DIR}"

## Website media
scp "create_fixture_jsons_csss_site.sh" csss@sfucsss.org:"/home/csss/create_jsons.sh"
ssh csss@sfucsss.org "/home/csss/create_jsons.sh"
scp -r csss@sfucsss.org:"/home/csss/csss-site/*.json" .
ssh csss@sfucsss.org "rm -fr /home/csss/csss-site/*.json"
ssh csss@sfucsss.org "rm /home/csss/create_jsons.sh"

rm -fr /home/csss/staging_assets/website/fixtures || true
mkdir /home/csss/staging_assets/website/fixtures || true
python3 ./redact_confidential_info.py
mv about.json /home/csss/staging_assets/website/fixtures/.
mv auth.json /home/csss/staging_assets/website/fixtures/.
mv announcements.json /home/csss/staging_assets/website/fixtures/.
mv django_mailbox.json /home/csss/staging_assets/website/fixtures/.
mv elections.json /home/csss/staging_assets/website/fixtures/.
mv resource_management.json /home/csss/staging_assets/website/fixtures/.
mv csss_cron_info.json /home/csss/staging_assets/website/fixtures/.
mv errors.json /home/csss/staging_assets/website/fixtures/.

rm -fr /home/csss/staging_assets/website/mailbox_attachments || true
scp -r csss@sfucsss.org:"/home/csss/media_root/mailbox_attachments" /home/csss/staging_assets/website/.

rm -fr /home/csss/staging_assets/website/exec-photos
scp -r csss@sfucsss.org:"/home/csss/static_root/about_static/exec-photos" /home/csss/staging_assets/website/.
rm -fr /home/csss/staging_assets/website/exec-photos/.git


## Wall_e media

scp "create_fixture_jsons_wall_e.sh" csss@jenkins.sfucsss.org:"/home/csss/create_jsons.sh"
ssh csss@jenkins.sfucsss.org "/home/csss/create_jsons.sh"
scp -r csss@jenkins.sfucsss.org:"/home/csss/wall_e.json" .
ssh csss@jenkins.sfucsss.org "rm -fr /home/csss/wall_e.json"
ssh csss@jenkins.sfucsss.org "rm /home/csss/create_jsons.sh"
mkdir -p /home/csss/staging_assets/wall_e/fixtures || true
mv wall_e.json /home/csss/staging_assets/wall_e/fixtures/.
