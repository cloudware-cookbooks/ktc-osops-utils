#
# Cookbook Name:: ktc-osops-utils
# Recipe:: packages
#

case node["platform"]
when "ubuntu", "debian"
  include_recipe "apt"

  # We want to use our local repo server and don't want to use key for the osops and grizzly repos
  apt_repository "osops" do
    uri node["osops"]["apt_repository"]["osops-packages"]
    distribution node["lsb"]["codename"]
    components ["main"]
    notifies :run, "execute[apt-get update]", :immediately
  end

  apt_repository "grizzly" do
    uri node["osops"]["apt_repository"]["openstack"]
    distribution "precise-updates/grizzly"
    components ["main"]
    notifies :run, "execute[apt-get update]", :immediately
  end

  apt_repository "grizzly-proposed" do
    uri node["osops"]["apt_repository"]["openstack"]
    distribution "precise-proposed/grizzly"
    components ["main"]
    notifies :run, "execute[apt-get update]", :immediately
  end

end
