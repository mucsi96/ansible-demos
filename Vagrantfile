Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-22.04"
  config.vm.define 'ubuntu'
  config.vm.provider "virtualbox"

  config.ssh.insert_key = false

  config.vm.hostname = "ansible-demos.cluster"
  config.vm.network "private_network", ip: "192.168.33.10" # if not internet connection enable dhcp in "Host Metwork Manager"

  config.vm.provider "virtualbox" do |v|
    v.linked_clone = true
    v.customize ['modifyvm', :id, '--audio', 'none']
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  # Prevent SharedFoldersEnableSymlinksCreate errors
  config.vm.synced_folder ".", "/vagrant", disabled: true

end
