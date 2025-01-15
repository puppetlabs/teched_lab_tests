# Copyright 2025. Puppet, Inc., a Perforce company.

require 'spec_helper'
set :backend, :exec # Set backend to exec for Linux localhost tests

describe package('puppet-agent') do
  it { is_expected.to be_installed }
end
