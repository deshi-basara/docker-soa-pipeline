#!/bin/bash
#
# Anmerkung: Normalerweise würden hier mehrere Remote-Git-Repositories abgefragt werden. Der
#            Einfachheit geschuldet liegen alle unsere Services im selben Repository.

set -e

cd cache

if [ ! -d docker-soa-pipeline ]; then
  echo "Cloning docker-soa-pipeline ..."
  # Falls ein valider Deployment-Key gesetzt wurde, muss das Repository über SSH bezogen werden
  # git clone git@github.com:deshi-basara/docker-soa-pipeline.git

  GIT_SSL_NO_VERIFY=true git clone https://github.com/deshi-basara/docker-soa-pipeline.git
else
  echo "Pulling docker-soa-pipeline ..."
  git pull
fi
cd ..
