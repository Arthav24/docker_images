IMAGE_NAME = slam_ros
CONTAINER_NAME = slam
ENTRY_COMMMAND = bash
NETWORK = host
DOCKER_VOLUMES = \
	-v ~/slam_ws:/slam_ws \
	-v ~/.ssh:/root/.ssh \
	-v "/tmp/.X11-unix:/tmp/.X11-unix:rw"

DOCKER_ENV_VARS = \
	--env="DISPLAY" \
	--env="QT_X11_NO_MITSHM=1" \
	--env="ROS_MASTER_URI=http://localhost:11311"

DOCKER_ARGS = ${DOCKER_VOLUMES} ${DOCKER_ENV_VARS}

.PHONY: image
image:
	docker build -f Dockerfile -t ${IMAGE_NAME} .

.PHONY: container
container:
	docker run -it --privileged --net=${NETWORK} \
	${DOCKER_ARGS} --name ${CONTAINER_NAME} ${IMAGE_NAME} ${ENTRY_COMMMAND}

.PHONY: delete_container
delete_container:
	docker container rm ${CONTAINER_NAME}