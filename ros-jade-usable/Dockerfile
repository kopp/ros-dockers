FROM osrf/ros:jade-desktop

# Install stuff to actually compile and run a workspace in the container.

RUN apt-get update \
    && apt-get install -y \
        screen \
        vim \
        python-catkin-tools \
    && rm -rf /var/lib/apt/lists/*

COPY screenrc /root/.screenrc
COPY vimrc /root/.vimrc
COPY bashrc /root/.bashrc
