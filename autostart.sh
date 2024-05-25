#!/bin/bash

source /opt/ros/$ROS_DISTRO/setup.bash

cd waver_ws && catkin_make

source devel/setup.bash

roslaunch waver_description display.launch
# roslaunch waver_description gazebo.launch

exec "$@"
