FROM debian:11

# Update package list and install Redis server
RUN apt-get update && apt-get install -y \
	redis-server

# Start the Redis server
CMD ["redis-server", "--protected-mode", "no"]