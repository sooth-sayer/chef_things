#!/bin/bash

apt-get update
apt-get -y install ruby1.9.3 build-essential wget libruby1.9.3 rubygems
gem update --no-rdoc --no-ri
gem install ohai chef --no-rdoc --no-ri
