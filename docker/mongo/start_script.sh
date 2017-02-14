#!/bin/bash

echo "Start mongo container"

    mongoimport --db rbac --collection admins --drop --file /data/db_import/admins.json

echo "End mongo container"
