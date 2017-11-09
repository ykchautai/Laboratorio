./rancher-compose --project-name sa-api-gateway \
--url http://192.168.99.100:8080/v1/projects/1a5 \
--access-key E627DC694F378B4D52A3 \
--secret-key QP4a4NRNQzHT52SqA6mYoX1fctqj2sZ9bU2oz4g5 \
-f docker-compose.yml \
--verbose up \
-d --force-upgrade \
--confirm-upgrade
