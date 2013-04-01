log_level                :info
log_location             STDOUT
node_name                'admin'
client_key               'admin.pem'
validation_client_name   'chef-validator'
validation_key           '.chef/chef-validator.pem'
chef_server_url          'https://33.33.66.100'
cache_type               'BasicFile'
cache_options( :path => 'checksums' )
cookbook_path [ "cookbooks", "site-cookbooks"]

knife[:ssh_user] = "vagrant"
knife[:ssh_password] = "vagrant"
