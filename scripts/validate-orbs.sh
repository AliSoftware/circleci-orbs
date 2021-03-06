#!/bin/bash -eo pipefail

# Check for circleci
command -v circleci > /dev/null || { echo "circleci is required to update the repo. Install it with 'brew install circleci'" >&2; exit 1; }

for ORB in src/*; do
  echo "Validating $ORB ..."

  circleci orb validate $ORB/orb.yml; RETURN_CODE=$?

  if [[ $RETURN_CODE != 0 ]]; then
  	exit 1
  fi
done
