#
# Cookbook Name:: janus
# Recipe:: default

include_recipe "common"
include_recipe "vim"
include_recipe "curl"
include_recipe "git"
include_recipe "ack"
include_recipe "ctags"
include_recipe "rake"

bash "install_janus" do
  user "#{node['common']['user_name']}"
  code <<-EOC
    curl -Lo- https://bit.ly/janus-bootstrap | bash
  EOC
end

directory "#{node['common']['home_path']}/#{node['common']['user_name']}/.janus" do
  owner "#{node['common']['user_name']}"
  group "#{node['common']['user_name']}"
  mode "0755"
  action :create
end
