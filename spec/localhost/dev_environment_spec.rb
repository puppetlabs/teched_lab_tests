# Copyright 2025. Puppet, Inc., a Perforce company.

require 'spec_helper'
set :backend, :exec # Set backend to exec for Linux localhost tests

context 'Dev Environment' do
  describe package('code') do
    it { is_expected.to be_installed }
  end

  describe package('gnome-desktop3') do
    it { is_expected.to be_installed }
  end

  describe package('git') do
    it { is_expected.to be_installed }
  end

  describe package('rpm-google-chrome-stable') do
    it { is_expected.to be_installed }
  end

  describe package('firefox') do
    it { is_expected.to be_installed }
  end

  describe package('pdk') do
    it { is_expected.to be_installed }
  end

  describe package('curl') do
    it { is_expected.to be_installed }
  end

  describe package('wget') do
    it { is_expected.to be_installed }
  end
end
