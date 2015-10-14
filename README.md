#### dev
- mkdir -p home/.ssh && cp ~/.ssh/id_rsa.pub home/.ssh/authorized_keys
- vagrant up
- ssh caleb-dev
- docker-compose up -d
- ruby-install ruby 2.1.7
- nvm install stable


#### Tell box to get a new IP
- vagrant ssh -c "sudo dhclient -r && sudo dhclient -v -r eth2 && sudo dhclient -v eth2"
