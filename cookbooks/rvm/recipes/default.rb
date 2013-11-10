#
# Cookbook Name:: rvm
# Recipe:: default

include_recipe "common"
include_recipe "curl"

bash "install_rvm" do
  user "#{node[:common][:user_name]}"
  code <<-EOC
    curl -L https://get.rvm.io | bash
  EOC
end
