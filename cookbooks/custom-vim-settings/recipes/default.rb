#
# Cookbook Name:: custom vim settings
# Recipe:: default

include_recipe "common"

directory "#{node[:common][:home_path]}/#{node[:common][:user_name]}/.vim/custom" do
  owner "#{node[:common][:user_name]}"
  group "#{node[:common][:user_name]}"
  mode "0755"
  action :create
end

%w{settings.vim mappings.vim functions.vim autocmds.vim}.each do |f|
  template "#{node[:common][:home_path]}/#{node[:common][:user_name]}/.vim/custom/#{f}" do
    source "#{f}"
    owner "#{node[:common][:user_name]}"
    group "#{node[:common][:user_name]}"
    mode 0644
  end
end

%w{.vimrc.before .vimrc.after}.each do |f|
  template "#{node[:common][:home_path]}/#{node[:common][:user_name]}/#{f}" do
    source "#{f}"
    owner "#{node[:common][:user_name]}"
    group "#{node[:common][:user_name]}"
    mode 0644
  end
end
