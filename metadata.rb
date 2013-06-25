name             "ktc-osops-utils"
maintainer       "KT Cloudware"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))
version          "1.0.16"

%w{ amazon centos debian fedora oracle redhat scientific ubuntu }.each do |os|
  supports os
end

%w{ osops-utils }.each do |dep|
  depends dep
end

