NAME=inception

VOLUME=./srcs/requirements/tools/volumes.sh

#running mandatory config
all: build
	@echo "Running configuration of Mandatory ${NAME}..."
	@docker-compose -f ./srcs/docker-compose.yml up -d mariadb redis wordpress nginx

#building config
build:
	@echo "Building configuration of all ${NAME}..."
	@${VOLUME} > /dev/null
	@docker-compose -f ./srcs/docker-compose.yml build --parallel
#stopping running
down: 
	@echo "Stopping config ${NAME}..."
	@docker-compose -f ./srcs/docker-compose.yml down > /dev/null

# start running bonus part
bonus: all
	@echo "Running configuration of all ${NAME}..."
	@docker-compose -f ./srcs/docker-compose.yml up -d ftp adminer static portainer 

ps:
	@docker-compose  -f ./srcs/docker-compose.yml ps -a

re: down all
	@echo "Restarting config ${NAME}..."

clean: down
	@echo "Cleaning config ${NAME}..."
	@docker system prune --all --force

fclean: clean
	@echo "Complete cleaning of all docker config ${NAME}..."
	@docker volume rm $$(docker volume ls -q)
	@sudo rm -rf /home/abounab/data

.PHONY: all build down re clean fclean