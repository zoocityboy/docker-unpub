#!/bin/sh
set -e
echo "Welcome to Unpub at ${DB_URL}"
unpubdev -d ${DB_URL}