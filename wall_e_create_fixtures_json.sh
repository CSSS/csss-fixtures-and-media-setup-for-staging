#!/bin/bash

set -e -o xtrace

docker exec -it PRODUCTION_MASTER_wall_e python3 django_db_orm_manage.py dumpdata --indent 4 --output wall_e.json
