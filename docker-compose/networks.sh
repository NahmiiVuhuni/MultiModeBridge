docker network create --driver=bridge --subnet=172.19.40.0/24 --ip-range=172.19.40.0/24 --gateawy 172.19.40.254 main
docker network create --driver=bridge --subnet=172.19.41.0/24 --ip-range=172.19.41.0/24 --gateway 172.19.41.254 ysf
docker network create --driver=bridge --subnet=172.19.42.0/24 --ip-range=172.19.42.0/24 --gateway 172.19.42.254 p25
docker network create --driver=bridge --subnet=172.19.43.0/24 --ip-range=172.19.43.0/24 --gateway 172.19.43.254 nxdn
docker network create --driver=bridge --subnet=172.19.44.0/24 --ip-range=172.19.44.0/24 --gateway 172.19.43.254 m17
docker network create --driver=bridge --subnet=172.19.50.0/24 --ip-range=172.19.50.0/24 --gateway 172.19.50.254 web
