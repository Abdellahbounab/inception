NAME=inception

VOLUME=./srcs/requirements/tools/volumes.sh

#running config
all:
	@echo "Running configuration of ${NAME}..."
	@${VOLUME} > /dev/null
	@docker-compose -f ./srcs/docker-compose.yml up -d > /dev/null


#building config
build:
	@echo "Building configuration ${NAME}..."
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

#stopping config
down:
	@echo "Stopping config ${NAME}..."
	@docker-compose -f ./srcs/docker-compose.yml down > /dev/null

ps:
	@docker-compose  -f ./srcs/docker-compose.yml ps -a

re: down 
	@echo "Restarting config ${NAME}..."
	@docker-compose -f ./srcs/docker-compose.yml up -d --build


#cleaning config (system prune -a: remove all unused images )
clean: down
	@echo "Cleaning config ${NAME}..."
	@docker system prune --all --force

fclean: clean
	@echo "Complete cleaning of all docker config ${NAME}..."
	@docker volume rm $$(docker volume ls -q)
	@sudo rm -rf /home/abounab/data

.PHONY: all build down re clean fclean