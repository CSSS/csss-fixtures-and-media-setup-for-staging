#!/bin/bash

set -e -o xtrace

docker exec PRODUCTION_MASTER_wall_e python3 django_db_orm_manage.py dumpdata --indent 4 --output wall_e.json
docker cp PRODUCTION_MASTER_wall_e:/usr/src/app/wall_e.json .
docker rm PRODUCTION_MASTER_wall_e:/usr/src/app/wall_e.json
