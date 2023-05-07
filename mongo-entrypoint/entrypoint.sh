#!/usr/bin/env bash
echo "Creating mongo users..."
env | sort
echo "Creating mongo database..."
mongo admin --host localhost -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_PASSWORD --eval "db.getSiblingDB('${MONGO_DB}');"

echo "Creating mongo users..."
mongo admin --host localhost -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_PASSWORD --eval "db.createUser({user: '${MONGO_UNPUBDEV_USERNAME}', pwd: '${MONGO_UNPUBDEV_PASSWORD}', roles: [{role: 'readWrite', db: '${MONGO_DB}'}]});"
echo "Mongo users created."