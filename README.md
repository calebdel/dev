# dev
mkdir -p home/.ssh && cp ~/.ssh/id_rsa.pub home/.ssh/authorized_keys
default: vagrant up
default: ssh caleb-dev
default: docker-compose up -d
default: ruby-install ruby 2.1.7
default: nvm install stable


Tell box to get a new IP
vagrant ssh -c "sudo dhclient -r && sudo dhclient -v -r eth2 && sudo dhclient -v eth2"
