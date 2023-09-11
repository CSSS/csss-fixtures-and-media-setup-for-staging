#!/bin/bash

set -e -o xtrace

docker exec PRODUCTION_MASTER_wall_e python3 django_manage.py dumpdata --indent 4 --output wall_e.json
docker cp PRODUCTION_MASTER_wall_e:/usr/src/app/wall_e.json .
docker exec PRODUCTION_MASTER_wall_e rm wall_e.json
