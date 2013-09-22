Add a user to a remote instance
===============================

Add the remote instance hostname to the user's local computer hosts
```
sudo vim /etc/hosts
```

Generate an ssh key pair on the user's local computer if none is already available
```
ssh-keygen -t rsa -C "email@example.com"
```

If generated key is not the default one "id_rsa.pub" than update ssh config and link remote machine hostname with the key
```
vim ./ssh/config
```

```
Host hostname
IdentityFile "~/.ssh/custom_rsa.pub"
```

Copy the public key to the remote machine
```
scp .ssh/id_rsa.pub username@hostname:~/id_rsa.pub.tmp
```

Ssh to the remote machine
```
ssh username@hostname
```

Create dev group if not exists, create user and grant sudo rights
```
sudo addgroup dev
sudo adduser --ingroup dev newuser
sudo adduser newuser sudo
```

Login as the new user and copy key to authorized keys
```
cd $HOME
sudo su newuser
mkdir $HOME/.ssh
chmod 700 $HOME/.ssh
sudo cat id_rsa.pub.tmp >> $HOME/.ssh/authorized_keys
chmod 600 $HOME/.ssh/authorized_keys
exit
rm id_rsa.pub.tmp
```

Tell the new user to use [these instructions](setup-user.md) to connect to github and setup their own individual dev environment.
