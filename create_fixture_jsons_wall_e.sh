#!/bin/bash

set -e -o xtrace

docker exec PRODUCTION_MASTER_wall_e python3 django_manage.py dumpdata wall_e_models.banrecord --indent 4 --output banrecords.json
docker exec PRODUCTION_MASTER_wall_e python3 django_manage.py dumpdata wall_e_models.commandstat --indent 4 --output commandstats.json
docker exec PRODUCTION_MASTER_wall_e python3 django_manage.py dumpdata wall_e_models.profilebucketinprogress --indent 4 --output profilebucketsinprogress.json
docker exec PRODUCTION_MASTER_wall_e python3 django_manage.py dumpdata wall_e_models.userpoint --indent 4 --output userpoints.json
docker exec PRODUCTION_MASTER_wall_e python3 django_manage.py dumpdata wall_e_models.level --indent 4 --output levels.json
docker exec PRODUCTION_MASTER_wall_e python3 django_manage.py dumpdata wall_e_models.reminder --indent 4 --output reminders.json

docker cp PRODUCTION_MASTER_wall_e:/usr/src/app/banrecords.json .
docker cp PRODUCTION_MASTER_wall_e:/usr/src/app/commandstats.json .
docker cp PRODUCTION_MASTER_wall_e:/usr/src/app/profilebucketsinprogress.json .
docker cp PRODUCTION_MASTER_wall_e:/usr/src/app/userpoints.json .
docker cp PRODUCTION_MASTER_wall_e:/usr/src/app/levels.json .
docker cp PRODUCTION_MASTER_wall_e:/usr/src/app/reminders.json .

docker exec PRODUCTION_MASTER_wall_e rm banrecords.json commandstats.json profilebucketsinprogress.json userpoints.json levels.json reminders.json
