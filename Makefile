NAME=inception

#running config
all:
	@echo "Running configuration ${NAME}..."
	@docker-compose -f ./srcs/docker-compose.yml up -d


#building config
build:
	@echo "Building configuration ${NAME}..."
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

#stopping config
down:
	@echo "Stopping config ${NAME}..."
	@docker-compose -f ./srcs/docker-compose.yml down

re: down 
	@echo "Restarting config ${NAME}..."
	@docker-compose -f ./srcs/docker-compose.yml up -d --build


#cleaning config (system prune -a: remove all unused images )
clean: down
	@echo "Cleaning config ${NAME}..."
	@docker system prune -a

fclean:
	@echo "Complete cleaning of all docker config ${NAME}..."
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force

.PHONY: all build down re clean fclean