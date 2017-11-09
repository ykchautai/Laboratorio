./rancher-compose --project-name sa-api-gateway \
--url http://192.168.99.100:8080/v1/projects/1a5 \
--access-key 430EEDB3987BB6ED0805 \
--secret-key 5PYZagMThf5ErVh2SEdAVzxTH3Wv1K1HwczMTYji \
-f docker-compose.yml \
--verbose up \
-d --force-upgrade \
--confirm-upgrade
