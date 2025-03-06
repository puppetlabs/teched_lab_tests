#!/bin/sh

# Puppet Task Name: run_localhost_test
# This task runs a test locally from the spec/localhost directory
if [ -f "spec/localhost/$PT_spec" ]; then
  echo "Running test $PT_spec"
  pdk bundle exec rspec spec/localhost/$PT_spec
else
  echo "Test $PT_spec not found"
  # exit 1
fi