# headshotbox-docker

This is a Dockerfile based on debian:jessie-slim to put [bugdone/headshotbox](https://github.com/bugdone/headshotbox) in a Docker.

Download the Dockerfile to your Docker server and execute:

```sudo docker build -t mikamikatze/hsbox - < Dockerfile```
  
After building an Image, you can start a Container with this terminal command:
```
sudo docker run -d --name hsbox \
-p 4000:4000 \
-v /home/<user>/demos-folder/:/root/demos \
-v /home/<user>/hsbox-config/:/root/.config/headshotbox \
mikamikatze/hsbox:latest
```
If you wish that I add more variables to the dockerfile, just open an issue.
I will try to keep this dockerfile up-to-date. Open an issue if I miss a release.
