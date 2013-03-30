#!/bin/bash
sudo rm -f /vagrant/.chef/*.pem
sudo cp /etc/chef-server/*.pem /vagrant/.chef/ -f -n
