Connect to github
```
ssh-keygen -t rsa -C "email@example.com"
cat .ssh/id_rsa.pub
# copy key to https://github.com/settings/ssh
ssh -T git@github.com
git config --global user.name "Your name"
git config --global user.email "email@example.com"
```

Setup individual remote development environment
```
cd $HOME
git clone https://github.com/alexgociu/setup-dev-env.git
./setup-dev-env/setup.sh
```

