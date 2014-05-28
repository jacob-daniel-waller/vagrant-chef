#
# Cookbook Name:: headless-firefox
# Recipe:: default
#
# Copyright 2013, Roadtrippers 
#
# Licensed under MIT License; please read LICENSE before using or distributing. 
#


case node[:platform]
when 'debian'
  package 'iceweasel' do
    action :upgrade
  end
else
  package 'firefox' do
    action :upgrade
  end
end

package 'xvfb' do
  action :upgrade
end

# this works better/more consistantly if it is included in the bundle
# gem_package 'headless' do
#   action :upgrade
# end

#magic_shell_environment 'SELENIUM_HEADLESS' do
    #value 'true'
#end
