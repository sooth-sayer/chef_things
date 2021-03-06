#
# Cookbook Name:: git config
# Attributes:: default
#
# Copyright 2010, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default[:git_config][:user_name] = "vagrant"
default[:git_config][:user_email] = "vagrant@null.com"
default[:git_config][:private_rsa_key_path] = "#{Chef::Config[:file_cache_path]}/id_rsa"
default[:git_config][:public_rsa_key_path] = "#{Chef::Config[:file_cache_path]}/id_rsa.pub"
