# OpenCV-4.1.2-for-Raspbian

Installation guide mostly from
https://gist.github.com/willprice/abe456f5f74aa95d7e0bb81d5a710b60

https://www.learnopencv.com/install-opencv-4-on-raspberry-pi/

https://www.theimpossiblecode.com/blog/build-faster-opencv-raspberry-pi3/

https://www.pyimagesearch.com/2019/09/16/install-opencv-4-on-raspberry-pi-4-and-raspbian-buster/

http://www.codebind.com/linux-tutorials/install-opengl-ubuntu-linux/

http://www.makble.com/undefined-reference-to-glulookat-how-to-fix-in-mingw-on-windows


Check Raspberry Version
$ cat /etc/os-release
"Raspbian GNU/Linux 10 (buster)"


# Installation
wget https://github.com/cyysky/OpenCV-4.1.2-for-Raspbian/raw/master/opencv_4.1.2-1_armhf.deb

sudo dpkg -i opencv_4.1.2-1_armhf.deb

sudo apt-get -f install

sudo dpkg -i opencv_4.1.2-1_armhf.deb
