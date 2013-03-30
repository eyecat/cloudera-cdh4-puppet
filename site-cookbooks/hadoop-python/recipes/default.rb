#
# Cookbook Name:: hadoop-python
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "python"
python_pip "dumbo" do
  action :install
end

python_pip "mrjob" do
  action :install
end

