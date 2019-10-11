#!/usr/bin/env bash
set -ex

OPENCV_VERSION=4.1.2
pushd ~/opencv/opencv-$OPENCV_VERSION
mkdir -p build
pushd build
RPI_VERSION=$(awk '{print $3}' < /proc/device-tree/model)
if [[ $RPI_VERSION -ge 4 ]]; then
  NUM_JOBS=$(nproc)
else
  NUM_JOBS=1 # Earlier versions of the Pi don't have sufficient RAM to support compiling with multiple jobs.
fi

# -D ENABLE_PRECOMPILED_HEADERS=OFF
# is a fix for https://github.com/opencv/opencv/issues/14868

# -D OPENCV_EXTRA_EXE_LINKER_FLAGS=-latomic
# is a fix for https://github.com/opencv/opencv/issues/15192

cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-$OPENCV_VERSION/modules \
      -D OPENCV_ENABLE_NONFREE=ON \
      -D BUILD_PERF_TESTS=OFF \
      -D BUILD_TESTS=OFF \
      -D BUILD_DOCS=ON \
      -D BUILD_EXAMPLES=ON \
      -D ENABLE_PRECOMPILED_HEADERS=OFF \
      -D BUILD_TIFF=ON \
      -D WITH_FFMPEG=ON \
      -D WITH_TBB=ON \
      -D BUILD_TBB=ON \
      -D WITH_OPENMP=ON \
      -D ENABLE_NEON=ON \
      -D ENABLE_LTO=ON \
      -D WITH_OPENCL=ON \
      -D WITH_GSTREAMER=ON \
      -D CPU_BASELINE=NEON \
      -D ENABLE_VFPV3=ON \
      -D WITH_OPENGL=ON \
      -D WITH_V4L=ON \
      -D WITH_LIBV4L=ON \
      -D WITH_QT=ON \
      -D OPENCV_EXTRA_EXE_LINKER_FLAGS=-latomic \
      -D CMAKE_SHARED_LINKER_FLAGS=-latomic \
      -D PYTHON3_EXECUTABLE=$(which python3) \
      -D PYTHON_EXECUTABLE=$(which python2) \
      ..
#make -j "$NUM_JOBS"
popd; popd