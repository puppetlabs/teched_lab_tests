# Copyright 2025. Puppet, Inc., a Perforce company.

require 'spec_helper'
set :backend, :exec # Set backend to exec for Linux localhost tests

context 'Primary Server' do
  describe service('pe-puppetserver') do
    it { is_expected.to be_enabled }
    it { is_expected.to be_running }
  end

  describe service('pe-puppetdb') do
    it { is_expected.to be_enabled }
    it { is_expected.to be_running }
  end

  describe service('puppet') do
    it { is_expected.to be_enabled }
    it { is_expected.to be_running }
  end

  describe package('puppet-agent') do
    it { is_expected.to be_installed }
  end
end
