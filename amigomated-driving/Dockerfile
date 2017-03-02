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
RUN catkin build

# append the setup of this workspace to bashrc
RUN echo "source ${WORKSPACE}/deve/setup.bash" >> ~/.bashrc
