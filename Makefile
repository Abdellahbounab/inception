NAME=inception

VOLUME=./srcs/requirements/tools/volumes.sh
DIR="/home/abounab/data/"

#running config
all:
	mkdir -p "${DIR}"/mariadb
	mkdir -p "${DIR}"/wordpress
	sudo chown -R www-data:www-data "${DIR}"/wordpress
	sudo chmod -R 777 "${DIR}"/wordpress
	@echo "Running configuration ${NAME}..."
	bash ${VOLUME}
	@docker-compose -f ./srcs/docker-compose.yml up -d


#building config
build:
	@echo "Building configuration ${NAME}..."
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

#stopping config
down:
	@echo "Stopping config ${NAME}..."
	@docker-compose -f ./srcs/docker-compose.yml down

ps:
	@docker-compose  -f ./srcs/docker-compose.yml ps -a

re: down 
	@echo "Restarting config ${NAME}..."
	@docker-compose -f ./srcs/docker-compose.yml up -d --build


#cleaning config (system prune -a: remove all unused images )
clean: down
	@echo "Cleaning config ${NAME}..."
	@docker system prune -af

fclean:
	@echo "Complete cleaning of all docker config ${NAME}..."
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/data/*

.PHONY: all build down re clean fclean