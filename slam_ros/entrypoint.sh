#!/bin/bash
 
# Source ROS and Catkin workspaces
source /opt/ros/melodic/setup.bash
echo "ROS Sourced"

#Checking if source exists or not
if [ ! -d /home/ros/slam_ws/src ]
then
mkdir -p /home/ros/slam_ws/src 
cd /home/ros/slam_ws/src
git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git -b melodic-devel
git clone  https://github.com/ROBOTIS-GIT/turtlebot3.git -b melodic-devel
cd /home/ros/slam_ws
catkin build
cd /home/ros/slam_ws/src
git clone https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
catkin build 
fi
if [ -f /home/ros/slam_ws/devel/setup.bash ]
then
source /home/ros/slam_ws/devel/setup.bash
echo "workspace sourced"
fi
export TURTLEBOT3_MODEL=waffle
exec "$@"