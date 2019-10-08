git pull origin git@github.com:luiswitz/expensescontrol.git

cd expenses_control

docker-compose -f docker-compose-production.yml down
docker-compose -f docker-compose-production.yml pull
docker-compose -f docker-compose-production.yml up -d
