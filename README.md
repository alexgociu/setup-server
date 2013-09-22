Setup server
==============

These instructions are for setting up an Ubuntu 12.04.2 LTS cloud server.

When creating the server instance on the cloud service providers, use the [hostname naming conventions](docs/hostname-naming-conventions.md) when asked for the hostname.

If it's not a temporary test/staging server, then it will probably have a longer life and/or will be shared with other devices or people, so it would be good to create a DNS record.

Install git and clone this rep

```
cd $HOME
sudo apt-get install vim
sudo apt-get install -y git-core
git clone https://github.com/alexgociu/setup-server.git
```

If you wish to install LAMP (Apache, PHP and MySQL) then run

```
./setup-server/setup-lamp.sh
```

If you wish to install node.js then run

```
./setup-server/setup-node.sh
```

Use [these instructions](docs/add-user.md) to add users for yourself and for your team members on the server

After all the users are added, edit sshd config

```
vim /etc/ssh/sshd_config
```

Disable ssh password auth and enable rsa auth

```
PasswordAuthentication no
RSAAuthentication yes
```

Restart ssh service

```
sudo service ssh restart
```

Update the hostname and reboot

```
sudo vim /etc/hostname
sudo reboot
```

Ssh to the server using your newly created user and follow [these instructions](docs/setup-user.md) to connect to github and setup your own individual dev environment

```
ssh username@hostname
```
