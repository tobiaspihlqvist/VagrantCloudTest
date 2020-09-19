
Vagrant.configure("2") do |config|
  config.vm.provider :digital_ocean
  config.vm.provider "virtualbox"
  config.vm.box = "bento/ubuntu-18.04"
 config.vm.provision :shell, :path => 'scripts/provision.sh'


 config.vm.provider :digital_ocean do |provider, override|
  override.ssh.private_key_path = '~/.ssh/id_rsa'
  override.vm.box = 'digital_ocean'
  override.vm.box_url = "https://github.com/devopsgroup-io/vagrant-digitalocean/raw/master/box/digital_ocean.box"
  override.nfs.functional = false
  override.vm.allowed_synced_folder_types = :rsync
  provider.token = $TOKEN
  provider.image = 'ubuntu-18-04-x64'
  provider.region = 'lon1'
  provider.size = '512mb'
  provider.setup = false
end

config.vm.provision "puppet" do |puppet|
  puppet.environment = "manifests"
end
config.vm.define "appserver" do |appserver|
appserver.vm.hostname = "appserver"

  end

config.vm.define "dbserver" do |dbserver|
dbserver.vm.hostname = "dbserver"
end
end
