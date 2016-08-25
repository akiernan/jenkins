# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "bento/centos-7.2"

  config.ssh.insert_key = false

  config.vm.network "forwarded_port", guest: 8080, host: 8088

  # from https://github.com/hashicorp/puppet-bootstrap
  config.vm.provision "install-puppet", type: "shell",
                      path: "vagrant/centos_7_x.sh"

  # install puppet modules we need
  config.vm.provision "install-puppet-modules", type: "shell", inline: <<-SHELL
    for puppet_module in rtyler-jenkins garethr-docker; do
      puppet module install "${puppet_module}"
    done
  SHELL

  # finally run puppet
  config.vm.provision "puppet" do |puppet|
    puppet.environment = "vagrant"
    puppet.environment_path = "puppet/environments"
  end
end
