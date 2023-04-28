#!/usr/bin/env sh

cd /opt/mongodb-mms-automation-agent-* 
nohup ./mongodb-mms-automation-agent \
  --config=local.config \
  >> /var/log/mongodb-mms-automation/automation-agent-fatal.log 2>&1 &