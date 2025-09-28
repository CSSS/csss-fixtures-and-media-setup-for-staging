#!/bin/bash

set -e -o xtrace

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "${BASE_DIR}"

## Website media
#rm -fr /home/csss/staging_assets || true
#mkdir -p /home/csss/staging_assets/website/fixtures || true
#
#scp "create_fixture_jsons_csss_site.sh" csss@sfucsss.org:"/home/csss/create_jsons.sh"
#ssh csss@sfucsss.org "/home/csss/create_jsons.sh"
#scp csss@sfucsss.org:"/home/csss/csss-site/about.json" .
#scp csss@sfucsss.org:"/home/csss/csss-site/django_mailbox.json" .
#scp csss@sfucsss.org:"/home/csss/csss-site/announcements.json" /home/csss/staging_assets/website/fixtures/.
#scp csss@sfucsss.org:"/home/csss/csss-site/auth.json" /home/csss/staging_assets/website/fixtures/.
#scp csss@sfucsss.org:"/home/csss/csss-site/csss_cron_info.json" /home/csss/staging_assets/website/fixtures/.
#scp csss@sfucsss.org:"/home/csss/csss-site/elections.json" /home/csss/staging_assets/website/fixtures/.
#scp csss@sfucsss.org:"/home/csss/csss-site/errors.json" /home/csss/staging_assets/website/fixtures/.
#scp csss@sfucsss.org:"/home/csss/csss-site/resource_management.json" /home/csss/staging_assets/website/fixtures/.
#
#ssh csss@sfucsss.org "rm /home/csss/csss-site/about.json"
#ssh csss@sfucsss.org "rm /home/csss/csss-site/announcements.json"
#ssh csss@sfucsss.org "rm /home/csss/csss-site/auth.json"
#ssh csss@sfucsss.org "rm /home/csss/csss-site/csss_cron_info.json"
#ssh csss@sfucsss.org "rm /home/csss/csss-site/django_mailbox.json"
#ssh csss@sfucsss.org "rm /home/csss/csss-site/elections.json"
#ssh csss@sfucsss.org "rm /home/csss/csss-site/errors.json"
#ssh csss@sfucsss.org "rm /home/csss/csss-site/resource_management.json"
#
#ssh csss@sfucsss.org "rm /home/csss/create_jsons.sh"
#
#python3 ./redact_confidential_info.py
#mv about.json /home/csss/staging_assets/website/fixtures/.
#mv django_mailbox.json /home/csss/staging_assets/website/fixtures/.
#
#mkdir -p /home/csss/staging_assets/website/mailbox_attachments || true
#scp -r csss@sfucsss.org:"/home/csss/media_root/mailbox_attachments" /home/csss/staging_assets/website/.
#
#mkdir -p /home/csss/staging_assets/website/exec-photos
#scp -r csss@sfucsss.org:"/home/csss/static_root/about_static/exec-photos" /home/csss/staging_assets/website/.
#rm -fr /home/csss/staging_assets/website/exec-photos/.git


## Wall_e media
mkdir -p /home/csss/staging_assets/wall_e/fixtures || true

scp "create_fixture_jsons_wall_e.sh" csss@jenkins.sfucsss.org:"/home/csss/create_jsons.sh"

ssh csss@jenkins.sfucsss.org "/home/csss/create_jsons.sh"
scp csss@jenkins.sfucsss.org:"/home/csss/banrecords.json" /home/csss/staging_assets/wall_e/fixtures/.
scp csss@jenkins.sfucsss.org:"/home/csss/commandstats.json" /home/csss/staging_assets/wall_e/fixtures/.
scp csss@jenkins.sfucsss.org:"/home/csss/profilebucketsinprogress.json" /home/csss/staging_assets/wall_e/fixtures/.
scp csss@jenkins.sfucsss.org:"/home/csss/userpoints.json" /home/csss/staging_assets/wall_e/fixtures/.
scp csss@jenkins.sfucsss.org:"/home/csss/levels.json" /home/csss/staging_assets/wall_e/fixtures/.
scp csss@jenkins.sfucsss.org:"/home/csss/reminders.json" /home/csss/staging_assets/wall_e/fixtures/.
scp csss@jenkins.sfucsss.org:"/home/csss/updatedusers.json" /home/csss/staging_assets/wall_e/fixtures/.

ssh csss@jenkins.sfucsss.org "rm /home/csss/create_jsons.sh"
ssh csss@jenkins.sfucsss.org "rm /home/csss/banrecords.json"
ssh csss@jenkins.sfucsss.org "rm /home/csss/commandstats.json"
ssh csss@jenkins.sfucsss.org "rm /home/csss/profilebucketsinprogress.json"
ssh csss@jenkins.sfucsss.org "rm /home/csss/userpoints.json"
ssh csss@jenkins.sfucsss.org "rm /home/csss/levels.json"
ssh csss@jenkins.sfucsss.org "rm /home/csss/reminders.json"
ssh csss@jenkins.sfucsss.org "rm /home/csss/updatedusers.json"
