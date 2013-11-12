#
# Cookbook Name:: rvm
# Recipe:: default

include_recipe "common"
include_recipe "curl"

execute "install_rvm" do
  user "#{node[:common][:user_name]}"
  action :run
  environment ({ "HOME" => "#{node[:common][:home_path]}/#{node[:common][:user_name]}", "USER" => "#{node[:common][:user_name]}" })
  command <<-EOC
    curl -L https://get.rvm.io | bash
  EOC
end
