echo Hello! This script will get OpenCV 4.9.0 
echo source code and install it for you

# Get the files required to build

wget -O OpenCV.4.9.0.zip https://github.com/opencv/opencv/archive/4.9.0.zip
# mv 4.9.0.zip OpenCV.4.9.0.zip
unzip OpenCV.4.9.0.zip
wget -O OpenCV_contrib.4.9.0.zip https://github.com/opencv/opencv_contrib/archive/refs/tags/4.9.0.zip
# mv 4.9.0.zip OpenCV_contrib.4.9.0.zip
unzip OpenCV_contrib.4.9.0.zip

# Get the tools required to build

sudo apt install python3-pip
pip3 install numpy matplotlib

# build in a seperate folder called 'build'

mkdir build
cd build
cmake -DOPENCV_EXTRA_MODULES_PATH=~/opencv_build/opencv_contrib-4.9.0/modules ../opencv-4.9.0
make -j$(nproc --a)

# Install it
sudo make install
