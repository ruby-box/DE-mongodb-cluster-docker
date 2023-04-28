FROM --platform=linux/amd64 ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get update && apt-get install -y curl sudo

# 파일 다운로드
RUN sudo mkdir -p /opt
RUN cd /tmp \
	&& curl -OL https://mms.mongodb.com/download/agent/automation/mongodb-mms-automation-agent-latest.linux_x86_64.tar.gz \
	&& tar -xvzf mongodb-mms-automation-agent-latest.linux_x86_64.tar.gz -C /opt \
	&& rm -rf /tmp/*.tar.gz 

# MMS Agent 설치
RUN ln -sf /opt/mongodb-mms-automation-agent-* /opt/mongodb-mms-automation-agent \
	&& cd /opt/mongodb-mms-automation-agent
COPY config/local.config /opt/mongodb-mms-automation-agent/local.config
COPY scripts/init-mms-agent.sh /tmp/init-mms-agent.sh
RUN chmod +x /tmp/init-mms-agent.sh \
	&& /tmp/init-mms-agent.sh

# MMS 설치 후 디렉터리 설정
RUN sudo mkdir -m 755 -p /var/lib/mongodb-mms-automation \
	&& sudo mkdir -m 755 -p /var/log/mongodb-mms-automation \
	&& sudo mkdir -m 755 -p /data
RUN chown mongodb:mongodb /var/lib/mongodb-mms-automation \
	&& chown mongodb:mongodb /var/log/mongodb-mms-automation \ 
	&& chown mongodb:mongodb /data 

COPY scripts/startup.sh /opt/mongodb-mms-automation-agent/startup.sh
RUN chmod +x /opt/mongodb-mms-automation-agent/startup.sh

ENTRYPOINT [ "/opt/mongodb-mms-automation-agent/startup.sh" ]