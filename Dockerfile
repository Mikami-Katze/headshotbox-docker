FROM debian:jessie-slim

RUN dpkg --add-architecture i386 \
&& echo "deb http://ppa.launchpad.net/linuxuprising/java/ubuntu bionic main" | tee /etc/apt/sources.list.d/linuxuprising-java.list \
&& apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 73C3DB2A \
&& echo oracle-java11-installer shared/accepted-oracle-license-v1-2 select true | /usr/bin/debconf-set-selections \
&& apt-get update && apt-get upgrade -y \
&& apt-get install -y wget libc6:i386 libncurses5:i386 libstdc++6:i386 oracle-java13-set-default \
&& apt-get clean \
&& mkdir /root/demos && mkdir /root/.config && mkdir /root/.config/headshotbox && mkdir /root/libs \
&& cd /root/ \
&& wget https://raw.githubusercontent.com/Mikami-Katze/headshotbox-docker/master/hsbox-0.18.2-standalone.jar \
&& wget https://raw.githubusercontent.com/Mikami-Katze/headshotbox-docker/master/demoinfogo \
&& cd /root/libs/ \
&& wget https://raw.githubusercontent.com/Mikami-Katze/headshotbox-docker/master/libgcc_s.so.1 \
&& wget https://raw.githubusercontent.com/Mikami-Katze/headshotbox-docker/master/libprotobuf.so.7 \
&& wget https://raw.githubusercontent.com/Mikami-Katze/headshotbox-docker/master/libstdc++.so.6 \
&& wget https://raw.githubusercontent.com/Mikami-Katze/headshotbox-docker/master/libz.so.1 \
&& chmod +x /root/demoinfogo \
&& ls -ls /root/

VOLUME /root/demos
VOLUME /root/.config/headshotbox
CMD cd /root/ && java -jar hsbox-0.18.2-standalone.jar --port 4000

EXPOSE 4000
