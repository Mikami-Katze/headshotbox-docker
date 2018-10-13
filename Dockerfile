FROM  openjdk:12-jdk-alpine 

RUN apk update && apk upgrade

RUN mkdir /root/demos && mkdir /root/.config && mkdir /root/.config/headshotbox
VOLUME /root/demos
VOLUME /root/.config/headshotbox

COPY hsbox-0.17.3-standalone.jar /root/hsbox-0.17.3-standalone.jar
COPY demoinfogo /root/demoinfogo
COPY libgcc_s.so.1 /root/libs/libgcc_s.so.1
COPY libprotobuf.so.7 /root/libs/libprotobuf.so.7
COPY libstdc++.so.6 /root/libs/libstdc++.so.6
COPY libstdc++.so.6 /root/libs/libstdc++.so.6
COPY headshotbox.sh /root/headshotbox.sh
RUN ls -ls /root/

CMD cd /root/ && ./headshotbox.sh

EXPOSE 4000
