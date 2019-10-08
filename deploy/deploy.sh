DIR="expensescontrol"

if [ -d "$DIR" ]; then
  cd $DIR
  git pull origin https://github.com/luiswitz/expensescontrol.git
else
  git clone https://github.com/luiswitz/expensescontrol.git
  cd $DIR
fi

docker-compose down
docker-compose pull
docker-compose up -d
