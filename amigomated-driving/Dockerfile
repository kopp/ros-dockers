FROM ros-jade-usable


# absolute path to the workspace
ENV WORKSPACE /root/AmigomatedDriving

# clone repo
RUN git clone https://github.com/kopp/AmigomatedDriving.git ${WORKSPACE} \
    && cd ${WORKSPACE} \
    && git submodule init \
    && git submodule update

# install dependencies
RUN cd ${WORKSPACE} \
    && catkin init \
    && catkin config --extend /opt/ros/jade \
    && rosdep update \
    && apt-get update \
    && rosdep install --default-yes --ignore-src --from-paths ${WORKSPACE}/src \
    && rm -rf /var/lib/apt/lists/*

# build packages
RUN cd ${WORKSPACE} \
    && catkin build

# append the setup of this workspace to bashrc
RUN echo "source ${WORKSPACE}/devel/setup.bash" >> ~/.bashrc


## Fixes
# - Remove 'libdc1394 error: Failed to initialize libdc1394' when using opencv
#   see http://stackoverflow.com/questions/12689304
RUN ln /dev/null /dev/raw1394
