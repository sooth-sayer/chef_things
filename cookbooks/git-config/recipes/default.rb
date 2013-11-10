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

bash "User configuration" do
  user "#{node[:common][:user_name]}"
  code <<-EOC
    git config --global user.name "#{node[:git_config][:user_name]}"
    git config --global user.email "#{node[:git_config][:user_email]}"
  EOC
end
