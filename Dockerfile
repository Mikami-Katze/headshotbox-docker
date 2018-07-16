FROM ubuntu

RUN dpkg --add-architecture i386
RUN apt-get update -y
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get update -y
RUN apt-get install -y oracle-java8-installer
RUN apt-get install -y libc6 libc6-i386
RUN apt-get install -y zlib1g zlib1g:i386
RUN apt-get purge -y software-properties-common
RUN apt-get autoclean -y

RUN mkdir /root/demos
VOLUME /root/demos
RUN mkdir /root/.config
RUN mkdir /root/.config/headshotbox
VOLUME /root/.config/headshotbox

COPY hsbox-0.17.2-standalone.jar /root/hsbox-0.17.2-standalone.jar
COPY demoinfogo /root/demoinfogo
COPY libgcc_s.so.1 /root/libs/libgcc_s.so.1
COPY libprotobuf.so.7 /root/libs/libprotobuf.so.7
COPY libstdc++.so.6 /root/libs/libstdc++.so.6
COPY libstdc++.so.6 /root/libs/libstdc++.so.6
COPY headshotbox.sh /root/headshotbox.sh
RUN ls -ls /root/

CMD cd /root/ && ./headshotbox.sh

EXPOSE 4000
