resource_name :sftp_user

property :username, String, name_property: true, required: true
property :password, String, name_property: true, required: true
property :group, String, name_property: true, required: true 
property :upload_dir, String, name_property: true, required: true

action :create do
  user_account new_resource.username do
    
    password new_resource.password
    groups [ new_resource.group ]
  end

  directory new_resource.upload_dir do
    owner new_resource.username
    path new_resource.upload_dir
    group new_resource.group
  end

  directory 'homedir' do
    owner 'root'
    path "/home/#{new_resource.username}"
    group new_resource.group 
  end

  cron 'sftp-upload-cleanup' do
    action node.tags.include?('sftp-upload-cleanup') ? :create : :delete
    minute '0'
    hour '23'
    weekday '0'
    user 'root' 
    mailto 'root@localhost'
    command "rm -rf #{new_resource.upload_dir}"
  end 
end
