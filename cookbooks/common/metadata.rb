name              "common"
maintainer        ""
maintainer_email  ""
license           ""
description       ""
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.0.1"
recipe            "common", "Installs common"

%w{ amazon arch centos debian fedora redhat scientific oracle amazon ubuntu windows }.each do |os|
  supports os
end

