#!/usr/bin/env bash

# Puppet Task Name: install_pdk

# Check that PDK is not already installed
if [ -n "$(command -v pdk)" ]
then
  echo "PDK is already installed"
  exit 0
fi

# Check what Linux distribution is installed and install PDK
OS=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
if [[ $OS = *"Rocky"* ]]; then
  VER=$(echo $(awk -F '"' '/^ROCKY_SUPPORT_PRODUCT_VERSION/{print $2}' /etc/os-release) | tr -d '"' | cut -d. -f1)
  sudo rpm -Uvh "https://yum.puppet.com/puppet-tools-release-el-$VER.noarch.rpm"
  sudo yum install -y pdk
  exit 0
elif [[ $OS = *"Ubuntu"* ]]; then
  VER=$(awk -F= '/^VERSION_CODENAME/{print $2}' /etc/os-release)
  wget "https://apt.puppet.com/puppet-tools-release-$VER.deb"
  PKG = "puppet-tools-release-$VER.deb"
  sudo dpkg -i $PKG
  sudo apt-get update
  sudo apt-get install -y pdk
  exit 0
else
  echo
  echo "Unsupported operating system." >&2
  echo
  exit 1
fi
