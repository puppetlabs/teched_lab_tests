# Copyright 2025. Puppet, Inc., a Perforce company.

require 'spec_helper'
set :backend, :exec # Set backend to exec for Linux localhost tests

context 'Gitea Server' do
  describe service('gitea') do
    it { is_expected.to be_enabled }
    it { is_expected.to be_running }
  end

  describe port(3000) do
    it { is_expected.to be_listening }
  end

  describe package('gitea') do
    it { is_expected.to be_installed }
  end
end
