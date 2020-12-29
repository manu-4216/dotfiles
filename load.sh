#!/usr/bin/env bash

file="$1"

# Check if the argument exist
if [ -z "${file}" ]; then
  echo 'Error! Please pass a config file to load'
  exit 1
fi

ln -sf $(pwd)/${file} ~/${file}
