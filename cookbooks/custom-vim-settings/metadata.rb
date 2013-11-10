name             "custom-vim-settings"
maintainer       "NoNamed"
maintainer_email "Empty"
license          ""
description      "Installs custom vim settings"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

%w{debian ubuntu arch}.each do |os|
  supports os
end

depends "common"
depends "janus"
