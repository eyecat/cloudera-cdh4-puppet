#
# Cookbook Name:: squid-deb-proxy
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apt"
package "squid-deb-proxy"
package "avahi-utils"

service "squid-deb-proxy" do
  action :start
end

