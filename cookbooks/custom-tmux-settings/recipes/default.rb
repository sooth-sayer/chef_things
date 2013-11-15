#
# Cookbook Name:: tmux custom config
# Recipe:: default

include_recipe "common"

template "#{node[:common][:home_path]}/#{node[:common][:user_name]}/.tmux.conf" do
  source ".tmux.conf"
  owner "#{node[:common][:user_name]}"
  group "#{node[:common][:user_name]}"
  mode 0644
end
