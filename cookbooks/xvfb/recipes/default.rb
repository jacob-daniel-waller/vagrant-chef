#
# Cookbook Name:: xvfb
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'xvfb' do
  action :install
end

service 'xvfb' do
  action [ :enable, :start ]
end
