sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt install ros-melodic-desktop-full
sudo apt-get update

sudo rosdep init
rosdep update

sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential python-catkin-tools

sudo apt-get install python-wstool python-catkin-tools  protobuf-compiler autoconf
# Change `melodic` below for your own ROS distro
sudo apt-get install ros-melodic-cmake-modules

# Setup catkin workspace
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
catkin init
catkin config --extend /opt/ros/melodic # Change `melodic` to your ROS distro
catkin config --cmake-args -DCMAKE_BUILD_TYPE=Release
catkin config --merge-devel

# Add workspace to bashrc.
echo 'source ~/catkin_ws/devel/setup.bash' >> ~/.bashrc

# Clone repo
cd ~/catkin_ws/src
git clone https://github.com/MIT-SPARK/Kimera-Semantics

# Install dependencies from rosinstall file using wstool
wstool init # Use unless wstool is already initialized

# Optionally add Kimera-Semantics to the rosinstall file
# wstool scrape

# For ssh:
# wstool merge Kimera-Semantics/install/kimera_semantics_ssh.rosinstall
# For https:
wstool merge Kimera-Semantics/install/kimera_semantics_https.rosinstall

# Download and update all dependencies
wstool update

# Compile code
catkin build kimera_semantics_ros

# Refresh workspace
source ~/catkin_ws/devel/setup.bash

