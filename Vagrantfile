# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "boxcutter/ubuntu1604"

  config.vm.network "forwarded_port", guest: 8080, host: 8088

  # http://foo-o-rama.com/vagrant--stdin-is-not-a-tty--fix.html
  config.vm.provision "fix-no-tty", type: "shell", privileged: false,
                      path: "vagrant/fix-no-tty.sh"

  # from https://github.com/hashicorp/puppet-bootstrap
  config.vm.provision "install-puppet", type: "shell",
                      env: {:PUPPET_COLLECTION => 'pc1',
                            :DEBIAN_FRONTEND => 'noninteractive'},
                      path: "vagrant/ubuntu.sh"

  # this dependency is missing from puppetlabs-apt
  config.vm.provision "install-software-properties-common",
                      type: "shell",
                      env: {:DEBIAN_FRONTEND => 'noninteractive'},
                      inline: "apt-get -y install software-properties-common"

  # install puppet modules we need
  config.vm.provision "install-puppet-modules", type: "shell", inline: <<-SHELL
    for puppet_module in puppetlabs-apt rtyler-jenkins stankevich-python garethr-docker; do
      puppet module install "${puppet_module}"
    done
  SHELL

  # finally run puppet
  config.vm.provision "puppet" do |puppet|
    puppet.environment = "vagrant"
    puppet.environment_path = "puppet/environments"
  end
end
