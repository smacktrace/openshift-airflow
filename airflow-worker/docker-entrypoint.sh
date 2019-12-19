#!/bin/bash
##  Docker Entrypoint for Airflow  on Openshift
##  MAINTAINER smacktrace <smacktrace942@gmail.com>

set -e

##################### CONFIGURE ARBITRARY OCP USER ################################
if ! whoami &> /dev/null; then
  if [ -w /etc/passwd ]; then
    echo "${USER_NAME:-default}:x:$(id -u):0:${USER_NAME:-default} user:${HOME}:/sbin/nologin" >> /etc/passwd
  fi
fi

###################### PYTHON SETUP ###############################################

export alias python=python3

if [ ! -f /airflow/airflow.db ]; then
        airflow initdb
fi

##########################      RUN CMD    ########################################

exec "$@"

