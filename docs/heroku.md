# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Config Heroku

heroku login
heroku keys:add

# Deploy staging app

git checkout test
heroku apps:create heroku-app-test --remote heroku-test
git push heroku-test test:master
heroku domains:add --app heroku-app-test test.example.com
# add dns CNAME test.example.com -> heroku-app-test.herokuapp.com

# Deploy live app

git checkout master
heroku apps:create heroku-app --remote heroku-live
git push heroku-live master:master
heroku domains:add --app heroku-app www.example.com
# add dns CNAME www.example.com -> heroku-app.herokuapp.com

