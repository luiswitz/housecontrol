DIR="expensescontrol"

if [ -d "$DIR" ]; then
  cd $DIR
  git pull origin master
else
  git clone https://github.com/luiswitz/expensescontrol.git
  cd $DIR
fi

docker-compose -f docker-compose.production.yml down
docker-compose -f docker-compose.production.yml build
docker-compose -f docker-compose.production.yml run --rm backend bundle install
docker-compose -f docker-compose.production.yml run --rm backend bundle exec rails db:create db:migrate
docker-compose -f docker-compose.production.yml up -d
