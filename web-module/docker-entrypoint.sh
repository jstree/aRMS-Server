#!/bin/sh

#packetbeat start
/usr/local/tomcat/packetbeat-7.4.2-linux-x86_64/packetbeat -e -c /usr/local/tomcat/packetbeat-7.4.2-linux-x86_64/packetbeat.yml &

#topbeat start
/usr/local/tomcat/topbeat-1.3.1-x86_64/topbeat -e -c /usr/local/tomcat/topbeat-1.3.1-x86_64/topbeat.yml &

#metricbeat start
/usr/local/tomcat/metricbeat-7.4.2-linux-x86_64/metricbeat -e -c /usr/local/tomcat/metricbeat-7.4.2-linux-x86_64/metricbeat.yml &

#heartbeat start
/usr/local/tomcat/heartbeat-7.4.2-linux-x86_64/heartbeat -e -c /usr/local/tomcat/heartbeat-7.4.2-linux-x86_64/heartbeat.yml &

#filebeat start
/usr/local/tomcat/filebeat-7.4.2-linux-x86_64/filebeat -e -c /usr/local/tomcat/filebeat-7.4.2-linux-x86_64/filebeat.yml &

#tomcat start
/usr/local/tomcat/bin/catalina.sh run