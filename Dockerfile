FROM  openjdk:13-jdk-alpine 

RUN apk update && apk upgrade \
&& apk add bash \
&& mkdir /root/demos && mkdir /root/.config && mkdir /root/.config/headshotbox && mkdir /root/libs \
&& cd /root/ \
&& wget https://raw.githubusercontent.com/Mikami-Katze/headshotbox-docker/master/hsbox-0.17.6-standalone.jar \
&& wget https://raw.githubusercontent.com/Mikami-Katze/headshotbox-docker/master/demoinfogo \
&& wget https://raw.githubusercontent.com/Mikami-Katze/headshotbox-docker/master/headshotbox.sh \
&& cd /root/libs/ \
&& wget https://raw.githubusercontent.com/Mikami-Katze/headshotbox-docker/master/libgcc_s.so.1 \
&& wget https://raw.githubusercontent.com/Mikami-Katze/headshotbox-docker/master/libprotobuf.so.7 \
&& wget https://raw.githubusercontent.com/Mikami-Katze/headshotbox-docker/master/libstdc++.so.6 \
&& wget https://raw.githubusercontent.com/Mikami-Katze/headshotbox-docker/master/libz.so.1 \
&& chmod +x /root/headshotbox.sh \
&& chmod +x /root/demoinfogo \
&& ls -ls /root/

VOLUME /root/demos
VOLUME /root/.config/headshotbox
CMD cd /root/ && ./headshotbox.sh

EXPOSE 4000