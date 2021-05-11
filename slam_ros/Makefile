IMAGE_NAME = slam_ros
CONTAINER_NAME = slam
CONTAINER_NAME_CUDA = slam_cuda
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

DOCKER_ENV_VARS_CUDA = \
	--gpus all \
    --env="NVIDIA_DRIVER_CAPABILITIES=all" \
	--env="DISPLAY" \
	--env="QT_X11_NO_MITSHM=1" \
	--env="ROS_MASTER_URI=http://localhost:11311"


DOCKER_ARGS = ${DOCKER_VOLUMES} ${DOCKER_ENV_VARS}

DOCKER_ARGS_CUDA = ${DOCKER_VOLUMES} ${DOCKER_ENV_VARS_CUDA}

.PHONY: image
image:
	docker build -f Dockerfile -t ${IMAGE_NAME} .

PHONY: image_CUDA
image_CUDA:
	docker build -f nvidia/Dockerfile -t ${IMAGE_NAME}:cuda .

.PHONY: container
container:
	docker run -it --privileged --net=${NETWORK} \
	${DOCKER_ARGS} --name ${CONTAINER_NAME} ${IMAGE_NAME} ${ENTRY_COMMMAND}

.PHONY: container_CUDA
container_CUDA:
	docker run -it --privileged --net=${NETWORK} \
	${DOCKER_ARGS_CUDA} --name ${CONTAINER_NAME_CUDA} ${IMAGE_NAME}:cuda ${ENTRY_COMMMAND}

.PHONY: tag
tag:
	docker tag ${IMAGE_NAME} arthav24/${IMAGE_NAME}

.PHONY: tag_cuda
tag_cuda:
	docker tag ${IMAGE_NAME}:cuda arthav24/${IMAGE_NAME}:cuda

.PHONY: delete_container	
delete_container:
	docker container rm ${CONTAINER_NAME}

.PHONY: delete_container_cuda
delete_container_cuda:
	docker container rm ${CONTAINER_NAME_CUDA}