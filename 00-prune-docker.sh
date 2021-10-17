docker rm -f $(docker ps -qa)
docker network prune -f
docker volume prune -f