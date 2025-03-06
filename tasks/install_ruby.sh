#!/usr/bin/env sh

# Puppet Task Name: install_ruby
# 
# This task installs Ruby on the target RHEL nodes.

# Check if Ruby is installed
if [ -n "$(command -v ruby)" ] || [ -f $HOME/.rubies/ruby-3.2.3/bin/ruby ]
then
  echo "Ruby is already installed"
  exit 0
fi

# Get required tools
if [ -n "$(command -v dnf)" ]
then
  sudo dnf install -y wget curl tar gcc bzip2
  sudo dnf --enablerepo=powertools install -y libyaml-devel libffi-devel
  sudo dnf install -y epel-release
  sudo dnf install -y make
elif [ -n "$(command -v apt-get)" ]
then
  sudo apt-get update
  sudo apt-get install -y wget curl tar gcc bzip2
  sudo apt-get install -y libyaml-dev libffi-dev build-essential 
  sudo apt-get install -y make
else
  echo "Unsupported package manager"
  exit 1
fi

# Get ruby-install
wget https://github.com/postmodern/ruby-install/releases/download/v0.10.1/ruby-install-0.10.1.tar.gz
tar -xzvf ruby-install-0.10.1.tar.gz
cd ruby-install-0.10.1/
sudo make install
sleep 30s


# Get chruby
wget https://github.com/postmodern/chruby/releases/download/v0.3.9/chruby-0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9/
sudo make install
sudo ./scripts/setup.sh
source /usr/local/share/chruby/chruby.sh

# Clean up
rm -rf ruby-install-0.10.1/ chruby-0.3.9/ ruby-install-0.10.1.tar.gz chruby-0.3.9.tar.gz

# Install Ruby
ruby-install ruby 3.2.3