#
# Cookbook Name:: consul-services
# Recipe:: mysql
#
# Copyright 2014 Adam Krone <adam.krone@thirdwavellc.com>
# Copyright 2014 Thirdwave, LLC
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

consul_definition 'mysql' do
  type 'service'
  parameters(port: 3306, check: { interval: '10s', script: 'pgrep mysql || exit 2' })
  notifies :restart, "consul_service[consul]", :delayed
end
