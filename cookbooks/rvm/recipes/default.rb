#
# Cookbook Name:: rvm
# Recipe:: default

include_recipe "curl"

bash "install_rvm" do
  user "vagrant"
  code <<-EOC
    curl -L https://get.rvm.io | bash
  EOC
end 
