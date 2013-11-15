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

%w{settings_after.vim settings_before.vim mappings.vim functions.vim autocmds.vim}.each do |f|
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

node[:custom_vim_settings].each do |setting_key, setting|
  if setting[:enable]
    execute "Add #{setting_key.to_s} custom settings" do
      user "#{node[:common][:user_name]}"
      group "#{node[:common][:user_name]}"
      environment ({ "HOME" => "#{node[:common][:home_path]}/#{node[:common][:user_name]}",
                     "USER" => "#{node[:common][:user_name]}" })
      setting.each do |option_key, option|
        command <<-EOC
          echo "#{option}" >> "#{node[:common][:home_path]}/#{node[:common][:user_name]}/.vim/custom/#{option_key.to_s}.vim"
        EOC
      end
    end
  end
end
