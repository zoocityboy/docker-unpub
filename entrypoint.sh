#!/bin/sh
set -e
echo "Welcome to Unpub at ${DB_URL}"
env | sort
unpubdev -d ${DB_URL}