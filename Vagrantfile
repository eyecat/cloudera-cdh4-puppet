# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'
  config.vm.box = "precise64"
  config.vm.provision :shell, :path => "bootstrap.sh", :args => ""
  config.vm.provision :puppet do |puppet|
    puppet.manifest_file = "site.pp"
    puppet.manifests_path = "manifests"
    puppet.module_path = ["modules"]
  end

  config.vm.define :master do |master_conf|
    master_conf.vm.host_name = "master"
    master_conf.vm.network :hostonly, "33.33.66.100"
    master_conf.vm.customize ["modifyvm", :id, "--memory", "768"]
    master_conf.vm.customize ["modifyvm", :id, "--name", "master"]
    master_conf.vm.customize ["modifyvm", :id, "--cpus", 1]
    master_conf.vm.provision :chef_solo do |chef|
      chef.roles_path = "roles"
      chef.cookbooks_path = ["cookbooks","site-cookbooks"]
      chef.add_recipe "apt"
      chef.add_recipe "build-essential"
      chef.add_recipe "git"
      chef.add_recipe "htop"
      chef.add_recipe "rstudio"
      chef.add_recipe "r"
      chef.add_recipe "python::pip"
      chef.add_recipe "hadoop-python"
      chef.add_role "chef"
    end
    master_conf.vm.provision :shell, :path => "post-bootstrap.sh", :args => ""
#    master_conf.vm.provision :chef_client do |chef|
#      chef.chef_server_url = "https://master"
#      chef.validation_key_path = ".chef/chef-validator.pem"
#    end
  end

  (1..2).each do |i|
    vmname = "slave#{i}"
    config.vm.define vmname.to_sym do |slave_conf|
      slave_conf.vm.host_name = vmname
      slave_conf.vm.network :hostonly, "33.33.66.#{i+100}"
      slave_conf.vm.customize ["modifyvm", :id, "--memory", "512"]
      slave_conf.vm.customize ["modifyvm", :id, "--name", vmname]
      slave_conf.vm.customize ["modifyvm", :id, "--cpus", 1]
      slave_conf.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = ["cookbooks","site-cookbooks"]
        chef.add_recipe "apt"
        chef.add_recipe "git"
        chef.add_recipe "r"
        chef.add_recipe "python::pip"
        chef.add_recipe "hadoop-python" 
      end
#      slave_conf.vm.provision :chef_client do |chef|
#        chef.chef_server_url = "https://master"
#        chef.validation_key_path = ".chef/chef-validator.pem"
#      end
    end
  end
end
