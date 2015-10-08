# -*- mode: ruby; tab-width: 2 -*-

require "erb"

Vagrant.configure(2) do |config|
  config.vm.box      = "ubuntu/trusty64"
  config.vm.hostname = "#{ENV['USER']}-dev.local"

  config.vm.provider "virtualbox" do |vb|
    vb.check_guest_additions = false
    vb.functional_vboxsf     = false
    vb.gui                   = false
    vb.memory                = 4096
    vb.cpus                  = 8
  end

  # don't mount default /vagrant folder
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # use NFS for home folder + nfs requires private
  # network on virtualbox
  config.vm.network "private_network", ip: "172.28.128.3"
  config.vm.synced_folder "home", "/home/#{ENV['USER']}", nfs: true

  # get a real ip on the network so we can share our
  # stuff
  config.vm.network "public_network"

  run build scripts through erb, then execute them.
  ["cedar.sh", "packages.sh", "user.sh", "tweaks.sh", "local.sh"]
    .map  { |filename| File.read("build/#{filename}") }
    .map  { |template| ERB.new(template).result }
    .each { |script|   config.vm.provision "shell", inline: script }

  config.vm.provision "shell", inline: <<-EOF
    echo =========================================
    echo =========================================
    echo Shutting down...
    echo
    echo Now, do something like:
    echo
    echo "mkdir -p home/.ssh && cp ~/.ssh/id_rsa.pub home/.ssh/authorized_keys"
    echo vagrant up
    echo
    echo ssh #{ENV['USER']}-dev
    echo docker-compose up -d
    echo ruby-install ruby 2.1.7
    echo nvm install stable
    echo git clone git@github.com:Guestfolio/guestfolio.git
    echo
    echo etc.
    echo =========================================
    echo =========================================
    shutdown -h now
  EOF
end
