# Copyright 2025. Puppet, Inc., a Perforce company.

require 'spec_helper'
set :backend, :exec # Set backend to exec for Linux localhost tests

context 'Agent Node' do
  describe package('puppet-agent') do
    it { is_expected.to be_installed }
  end

  describe service('puppet') do
    it { is_expected.to be_enabled }
    it { is_expected.to be_running }
  end
end
