docker files using ros


# dockers

## ros-jade-usable

Use ros desktop and install some additional tools and files to be able to
catkin build a package and run multiple applications in one container via
screen.


## amigomated-driving

Check out
[AmigomatedDriving](https://github.com/kopp/AmigomatedDriving.git),
install all required dependencies and build the package.
This should enable you to run the packages directly.



# X11

to get X11 support, run

    xhost +local:root
    docker run -it --rm --env="DISPLAY" --env="QT_X11_NO_MITSHM=1" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" <name>
    xhost -local:root

or some other more safe technique from
[here](http://wiki.ros.org/docker/Tutorials/GUI)

