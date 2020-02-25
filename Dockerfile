FROM debian:buster-slim

RUN dpkg --add-architecture i386 \
&& apt-get update && apt-get upgrade -y \
&& apt-get install gnupg -y \
&& mkdir -p /usr/share/man/man1

RUN apt-get install -y wget libc6:i386 libncurses5:i386 libstdc++6:i386 openjdk-11-jre-headless \
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
