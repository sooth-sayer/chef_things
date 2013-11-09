#!/bin/bash

apt-get update
apt-get -y remove ruby
apt-get -y install ruby1.9.3 build-essential wget
gem update --no-rdoc --no-ri
gem install ohai chef --no-rdoc --no-ri
