git pull origin git@github.com:luiswitz/expensescontrol.git

cd expenses_control

docker-compose down
docker-compose pull
docker-compose up -d
