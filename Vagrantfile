Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2 
  end

  config.vm.hostname = 'sftp-demo.vagrant'
  config.vm.synced_folder "sftp", "/vagrant/sftp"
  config.vm.provision "shell", path: "bootstrap.sh"
end

