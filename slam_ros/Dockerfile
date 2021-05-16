FROM osrf/ros:melodic-desktop-full

# Change the default shell to Bash
SHELL [ "/bin/bash" , "-c" ]

#adding user
RUN groupadd --gid 1000 ros \
    && useradd --uid 1000 --gid ros --shell /bin/bash --create-home ros

# Install Git
RUN apt-get update &&  \ 
    apt-get install -y git build-essential xclip

#Install catkin tools
RUN apt-get update && \
    apt-get install python-catkin-tools -y

RUN apt-get install ros-melodic-navigation -y
RUN apt-get install ros-melodic-slam-gmapping -y

COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]

RUN mkdir -p /home/ros/slam_ws && chown -R ros:ros /home/ros/slam_ws
USER ros

RUN echo "alias burger='export TURTLEBOT3_MODEL=burger'" >> ~/.bashrc && \
    echo "alias waffle='export TURTLEBOT3_MODEL=waffle'" >> ~/.bashrc && \
    echo "alias tb3fake='roslaunch turtlebot3_fake turtlebot3_fake.launch'" >> ~/.bashrc && \
    echo "alias tb3teleop='roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch'" >> ~/.bashrc && \
    echo "alias tb3='roslaunch turtlebot3_gazebo turtlebot3_empty_world.launch'" >> ~/.bashrc && \
    echo "alias tb3maze='roslaunch turtlebot3_gazebo turtlebot3_world.launch'" >> ~/.bashrc && \
    echo "alias tb3house='roslaunch turtlebot3_gazebo turtlebot3_house.launch'" >> ~/.bashrc && \
    echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc && \
    printf "if [ -d /slam_ws/devel/ ] \nthen\n source /slam_ws/devel/setup.bash \nfi" >> ~/.bashrc

WORKDIR /home/ros/slam_ws
