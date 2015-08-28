# HDHomeRun DVR Docker Image

Docker image for the HDHomeRun Record DVR software.  Also includes Samba with required mounts.

# Usage
    docker run -d --net=host arjones67/hdhomerun_dvr

# Details

* currently running HDHemeRun Record 20150821atest2 
* Your HDHomerun must be activated as documented in the Silicondust Forum. All rules and policies from Silicondust must be followed.
* Notice the "--net=host".  This is required because I could only get the dvr software to listen on the same IP range used by the container.  For example if the Docker container uses 172.17.x.x but everything on your network is on 192.168.x.x, the dvr software will not be able to discover your HDHomerun hardware.  There is a downside to using "--net=host".  You're basically telling Docker to not containerize the network stack.  I hope to find a workaround in the future.
* By default the video will be stored within the container.  If you want the video to persist a container being detroyed, mount an external volume at /hdhomerun/video

    
    docker run -d -v /video:/hdhomerun/video --net=host arjones67/hdhomerun_dvr


* If you want to disable the included Samba server, pass an environment varialbe using -e named SAMBA with a value of "off" or "false".  This could be useful if you want to use a Samba server on the host, in another container, or use some other way to create the required network mount.  If you try to run a Samba server on the host and in the container, they will conflict.


    docker run -d -e SAMBA=off --net=host arjones67/hdhomerun_dvr



# File/Directory Paths
If you want to customize the configuration, you can create a new Docker layer with your config files.  Just replace the following files with your files.
* smb.conf = /etc/samba/smb.conf
* hdhomerun.conf = /hdhomerun/etc/hdhomerun.conf
* recorded video path = /hdhomerun/video

# Source
https://github.com/arjones67/hdhomerun_dvr


Note: HDHomeRun DVR software included in the image is used with permission from Silicon Dust.
