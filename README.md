# headshotbox-docker

This is a Dockerfile based on openjdk:12-jdk-alpine to put [bugdone/headshotbox](https://github.com/bugdone/headshotbox) in a Docker.

But this on your Docker server and execute:

```sudo docker build -t hsbox headshotbox-docker```
  
After building an Image, you can start a Container with this
```
sudo docker run -d --name hsbox \
-p 4000:4000 \
-v /home/<user>/demos-folder/:/root/demos \
-v /home/<user>/hsbox-config/:/root/.config/headshotbox \
hsbox:latest
```
If you wish that I add more variables to the dockerfile, just open an issue.
I will try to keep this dockerfile up-to-date. Open an issue if I miss a release.
