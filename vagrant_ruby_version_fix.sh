#!/bin/bash

apt-get update
apt-get -y install ruby1.9.1-dev --no-upgrade
apt-get -y install build-essential wget
gem install ohai chef --no-rdoc --no-ri
rm /opt/vagrant_ruby/bin/ruby
ln -s /usr/bin/ruby /opt/vagrant_ruby/bin/ruby
