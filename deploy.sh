git add .
git commit -am "deploy"
git push
git pull heroku master
git push heroku master
