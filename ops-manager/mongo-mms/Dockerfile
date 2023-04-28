FROM --platform=linux/amd64 ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

#RUN apt-get update && apt-get install -y curl supervisor sudo
RUN apt-get update && apt-get install -y curl sudo vim

#EXPOSE 8080

# 6.0 version은 MongoDB 4.2 지원X
#RUN cd /tmp \
#	&& curl -OL https://downloads.mongodb.com/on-prem-mms/deb/mongodb-mms-6.0.12.100.20230406T1856Z.amd64.deb \
#	&& dpkg -i --force-architecture mongodb-mms-6.0.12.100.20230406T1856Z.amd64.deb \
#	&& rm /tmp/*.deb

RUN cd /tmp \
	&& curl -OL https://downloads.mongodb.com/on-prem-mms/deb/mongodb-mms_5.0.19.100.20230209T0941Z-1_x86_64.deb \
	&& dpkg -i --force-architecture mongodb-mms_5.0.19.100.20230209T0941Z-1_x86_64.deb \
	&& rm /tmp/*.deb

COPY config/conf-mms-5.0.properties /opt/mongodb/mms/conf/conf-mms.properties
# COPY config/conf-deamon.properties /opt/mongodb/mms-backup-daemon/conf/conf-daemon.properties

COPY scripts/startup.sh /opt/mongodb/startup.sh
RUN chmod +x /opt/mongodb/startup.sh

COPY config/gen.key /etc/mongodb-mms/gen.key

ENTRYPOINT [ "/opt/mongodb/startup.sh" ]