#
# Cookbook Name:: git config
# Recipe:: default

include_recipe "common"

git_completion = %w{git-completion.bash git-flow-completion.bash}
git_config = %w{.gitconfig}

(git_completion + git_config).each do |f|
  template "#{node[:common][:home_path]}/#{node[:common][:user_name]}/#{f}" do
    source "#{f}"
    owner "#{node[:common][:user_name]}"
    group "#{node[:common][:user_name]}"
    mode 0644
  end
end

git_completion.each do |f|
  bash "Install #{f}" do
    user "#{node[:common][:user_name]}"
    code <<-EOC
      echo "source #{node[:common][:home_path]}/#{node[:common][:user_name]}/#{f}" >> "#{node[:common][:home_path]}/#{node[:common][:user_name]}/.bashrc"
    EOC
  end
end

execute "User configuration" do
  user "#{node[:common][:user_name]}"
  group "#{node[:common][:user_name]}"
  action :run
  environment ({"HOME" => "#{node[:common][:home_path]}/#{node[:common][:user_name]}", "USER" => "#{node[:common][:user_name]}" })
  command <<-EOC
    git config --global user.name "#{node[:git_config][:user_name]}"
    git config --global user.email "#{node[:git_config][:user_email]}"
  EOC
end

# FIXME Adding github to known hosts seems like a hack...
bash "Add default ssh keys and add github to known hosts" do
  user "#{node[:common][:user_name]}"
  returns [0, 1]
  code <<-EOC
    cp "#{node[:git_config][:private_rsa_key_path]}" "#{node[:common][:home_path]}/#{node[:common][:user_name]}/.ssh/id_rsa"
    chmod 600 "#{node[:common][:home_path]}/#{node[:common][:user_name]}/.ssh/id_rsa"
    cp "#{node[:git_config][:public_rsa_key_path]}" "#{node[:common][:home_path]}/#{node[:common][:user_name]}/.ssh/id_rsa.pub"
    chmod 600 "#{node[:common][:home_path]}/#{node[:common][:user_name]}/.ssh/id_rsa.pub"
    ssh -T -o StrictHostKeyChecking=no git@github.com
  EOC
end
