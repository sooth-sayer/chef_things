#
# Cookbook Name:: vim-ruby
# Recipe:: default

include_recipe "common"
include_recipe "janus"

git "#{node[:common][:home_path]}/#{node[:common][:user_name]}/.janus/vim-ruby" do
  repository "git@github.com:vim-ruby/vim-ruby.git"
  reference "master"
  user "#{node[:common][:user_name]}"
  action :sync
end
