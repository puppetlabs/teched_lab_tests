#!/bin/sh

# Puppet Task Name: run_localhost_test

# Exit if spec parameter is not set
if [ -z "$PT_spec" ]; then
  echo "Spec parameter is required"
  exit 1
fi

# This task runs a test locally from the spec/localhost directory
if [ -f "spec/localhost/$PT_spec" ]; then
  echo "Running test $PT_spec"
  pdk bundle exec rspec spec/localhost/$PT_spec
else
  echo "Test $PT_spec not found"
  exit 1
fi