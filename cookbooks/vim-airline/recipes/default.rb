#
# Cookbook Name:: vim-airline
# Recipe:: default

include_recipe "common"
include_recipe "janus"

git "#{node[:common][:home_path]}/#{node[:common][:user_name]}/.janus/vim-airline" do
  repository "git@github.com:bling/vim-airline.git"
  reference "master"
  user "#{node[:common][:user_name]}"
  action :sync
end
