FROM osrf/ros:melodic-desktop-full

# Change the default shell to Bash
SHELL [ "/bin/bash" , "-c" ]
 
# Install Git
RUN apt-get update &&  \ 
    apt-get install -y git

#Install catkin tools
RUN apt-get update && \
    apt-get install python-catkin-tools -y

RUN apt-get install ros-melodic-navigation -y
RUN apt-get install ros-melodic-slam-gmapping -y

RUN echo "alias burger='export TURTLEBOT3_MODEL=burger'" >> ~/.bashrc && \
    echo "alias waffle='export TURTLEBOT3_MODEL=waffle'" >> ~/.bashrc && \
    echo "alias tb3fake='roslaunch turtlebot3_fake turtlebot3_fake.launch'" >> ~/.bashrc && \
    echo "alias tb3teleop='roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch'" >> ~/.bashrc && \
    echo "alias tb3='roslaunch turtlebot3_gazebo turtlebot3_empty_world.launch'" >> ~/.bashrc && \
    echo "alias tb3maze='roslaunch turtlebot3_gazebo turtlebot3_world.launch'" >> ~/.bashrc && \
    echo "alias tb3house='roslaunch turtlebot3_gazebo turtlebot3_house.launch'" >> ~/.bashrc 


COPY ./entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]

WORKDIR /slam_ws
