#!/bin/bash
#add fix to exercise5-server1 here

# create private key
[ -f /vagrant/id_rsa ] || {
su - vagrant -c "ssh-keygen -t rsa -f /vagrant/id_rsa -q -N ''"
}

#set key to vagrant user
[ -f /home/vagrant/.ssh/id_rsa ] || {
cp /vagrant/id_rsa /home/vagrant/.ssh/id_rsa
chmod 0600 /home/vagrant/.ssh/id_rsa
chown vagrant /home/vagrant/.ssh/id_rsa
}

# update authorized_keys to passwordless ssh
grep 'vagrant@server' ~vagrant/.ssh/authorized_keys &>/dev/null || {
cat /vagrant/id_rsa.pub >> ~vagrant/.ssh/authorized_keys
chmod 0600 ~vagrant/.ssh/authorized_keys
}

#exclude other server2 from host checking
cat > ~vagrant/.ssh/config <<EOF
Host server2
StrictHostKeyChecking no
UserKnownHostsFile=/dev/null
EOF



