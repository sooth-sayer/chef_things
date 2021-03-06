#
# Cookbook Name:: custom vim settings
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
default[:custom_vim_settings][:airline] = {
  enable: true,
  settings_before: <<-EOS
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
  EOS
}
default[:custom_vim_settings][:colorschemes] = {
  enable: true,
  settings_after: "colorscheme smyck"
}
