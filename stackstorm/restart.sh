docker-compose down
docker rmi stackstorm:v1
docker volume rm stackstorm_mongo-configdb-volume stackstorm_mongo-volume stackstorm_postgres-volume stackstorm_rabbitmq-volume stackstorm_redis-volume stackstorm_stackstorm-configs-volume stackstorm_stackstorm-log-volume stackstorm_stackstorm-packs-volume stackstorm_stackstorm-virtualenvs-volume
cd /opt/stackstorm/build-stackstorm-image
docker build -t stackstorm:v1 ./
cd /opt/stackstorm/stackstorm/
docker-compose up -d
