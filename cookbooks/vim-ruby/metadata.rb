name             "vim-ruby"
maintainer       "NoNamed"
maintainer_email "Empty"
license          "Apache 2.0"
description      "Install vim-ruby"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

%w{debian ubuntu arch}.each do |os|
  supports os
end

depends "common"
depends "janus"
