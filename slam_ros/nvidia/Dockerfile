FROM nvidia/cudagl:11.3.0-base-ubuntu18.04
# Minimal setup
RUN apt-get update \
 && apt-get install -y locales lsb-release
ARG DEBIAN_FRONTEND=noninteractive
RUN dpkg-reconfigure locales
 
# Install ROS melodic
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN apt-get update \
 && apt-get install -y --no-install-recommends ros-melodic-desktop-full
RUN apt-get install -y --no-install-recommends python-rosdep
RUN rosdep init \
 && rosdep fix-permissions \
 && rosdep update
RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

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

COPY ./entrypoint.sh .
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
