log_level                :info
log_location             STDOUT
node_name                'admin'
client_key               '/home/yuhui/VagrantWork/cloudera-cdh4-puppet/.chef/admin.pem'
validation_client_name   'chef-validator'
validation_key           '/home/yuhui/VagrantWork/cloudera-cdh4-puppet/.chef/chef-validator.pem'
chef_server_url          'https://33.33.66.100'
cache_type               'BasicFile'
cache_options( :path => '/home/yuhui/VagrantWork/cloudera-cdh4-puppet/.chef/checksums' )
