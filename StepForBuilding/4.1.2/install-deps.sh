#!/usr/bin/env bash
set -ex

sudo apt-get purge -y libreoffice*
sudo apt-get clean
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y
# For some reason I couldn't install libgtk2.0-dev or libgtk-3-dev without running the 
# following line
# See https://www.raspberrypi.org/forums/viewtopic.php?p=1254646#p1254665 for issue and resolution
sudo apt-get install -y devscripts debhelper cmake libldap2-dev libgtkmm-3.0-dev libarchive-dev \
                        libcurl4-openssl-dev intltool
sudo apt-get install -y build-essential cmake pkg-config libjpeg-dev libtiff5-dev libjasper-dev \
                        libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
                        libxvidcore-dev libx264-dev libgtk2.0-dev libgtk-3-dev \
                        libatlas-base-dev libblas-dev libeigen{2,3}-dev liblapack-dev \
                        gfortran \
                        python2.7-dev python3-dev python-pip python3-pip python python3
#https://stackoverflow.com/questions/37678324/compiling-opencv-with-gstreamer-cmake-not-finding-gstreamer
sudo apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt-get install -y libavresample*
sudo apt-get install -y qt5-default
sudo apt-get install -y tesseract-ocr libtesseract-dev libleptonica-dev
#OpenGl http://www.codebind.com/linux-tutorials/install-opengl-ubuntu-linux/
sudo apt-get install -y libglu1-mesa-dev freeglut3-dev mesa-common-dev
sudo pip2 install -U pip
sudo pip3 install -U pip
sudo pip2 install numpy
sudo pip3 install numpy