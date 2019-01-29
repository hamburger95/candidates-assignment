#!/bin/bash
#add fix to exercise5-server1 here
ssh-keygen -t rsa -P '' -f /home/vagrant/.ssh/id_rsa;
cat .ssh/id_rsa.pub | ssh vagrant@server2 'cat >> .ssh/authorized_keys'
#password server2
ssh server2

sed -i 's/StrictHostKeyChecking ask/StrictHostKeyChecking no/g' /etc/ssh/ssh_config
sudo service ssh  restart
