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

rm -fr /mnt/dev_csss_website_media/fixtures || true
mkdir /mnt/dev_csss_website_media/fixtures || true
python3 ./redact_confidential_info.py
mv about.json /mnt/dev_csss_website_media/fixtures/.
mv auth.json /mnt/dev_csss_website_media/fixtures/.
mv announcements.json /mnt/dev_csss_website_media/fixtures/.
mv django_mailbox.json /mnt/dev_csss_website_media/fixtures/.
mv elections.json /mnt/dev_csss_website_media/fixtures/.
mv resource_management.json /mnt/dev_csss_website_media/fixtures/.

rm -fr /mnt/dev_csss_website_media/mailbox_attachments || true
scp -r csss@sfucsss.org:"/home/csss/media_root/mailbox_attachments" /mnt/dev_csss_website_media/.

rm -fr /mnt/dev_csss_website_media/exec-photos
scp -r csss@sfucsss.org:"/home/csss/static_root/about_static/exec-photos" /mnt/dev_csss_website_media/.
rm -fr /mnt/dev_csss_website_media/exec-photos/.git


## Wall_e media

scp "create_fixture_jsons_wall_e.sh" csss@jenkins.sfucsss.org:"/home/csss/create_jsons.sh"
ssh csss@jenkins.sfucsss.org "/home/csss/create_jsons.sh"
scp -r csss@jenkins.sfucsss.org:"/home/csss/wall_e.json" .
ssh csss@jenkins.sfucsss.org "rm -fr /home/csss/wall_e.json"
ssh csss@jenkins.sfucsss.org "rm /home/csss/create_jsons.sh"
mkdir -p /mnt/dev_csss_wall_e/fixtures || true
mv wall_e.json /mnt/dev_csss_wall_e/fixtures/.
