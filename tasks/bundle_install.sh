#!/bin/sh

# Puppet Task Name: bundle_install

if [ -n "$(command -v pdk)" ]
then
  pdk bundle install
  exit 0
else
  echo "PDK is not installed"
  exit 1
fi