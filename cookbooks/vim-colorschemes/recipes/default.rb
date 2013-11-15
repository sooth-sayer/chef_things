#
# Cookbook Name:: vim-colorschemes
# Recipe:: default

include_recipe "common"
include_recipe "janus"

git "#{node[:common][:home_path]}/#{node[:common][:user_name]}/.janus/vim-colorschemes" do
  repository "git@github.com:flazz/vim-colorschemes.git"
  reference "master"
  user "#{node[:common][:user_name]}"
  action :sync
end
