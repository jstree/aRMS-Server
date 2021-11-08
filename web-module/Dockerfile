FROM tomcat:8.5.64-jdk8-openjdk
MAINTAINER 313DEVGRP <313@313.co.kr>

RUN rm -rf /usr/local/tomcat/webapps/ROOT
ARG JAR_FILE
ADD target/${JAR_FILE} /usr/local/tomcat/webapps/ROOT.war

RUN apt-get update
RUN apt-get -y -q install libpcap0.8 wget procps

RUN wget http://www.313.co.kr/nexus/content/groups/public/313devgrp/scouter/2.8.1/scouter-2.8.1.jar
RUN mv scouter-2.8.1.jar /usr/local/tomcat/lib/scouter.agent.jar
ADD script/yml/monitoring/client/scouter-2.8.1.conf /usr/local/tomcat/conf/scouter.conf

RUN wget http://www.313.co.kr/nexus/content/groups/public/313devgrp/elastic-apm-agent/1.18.1/elastic-apm-agent-1.18.1.jar
RUN mv elastic-apm-agent-1.18.1.jar /usr/local/tomcat/lib/elastic-apm-agent.jar

ENV JAVA_OPTS="-Xmx4g -Xms4g -javaagent:/usr/local/tomcat/lib/scouter.agent.jar -Dscouter.config=/usr/local/tomcat/conf/scouter.conf -Dobj_name=www313cokr -javaagent:/usr/local/tomcat/lib/elastic-apm-agent.jar -Delastic.apm.service_name=www313cokr -Delastic.apm.application_packages=egovframework.api,egovframework.com -Delastic.apm.server_urls=http://192.168.25.46:8200"

ADD docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["sh","/entrypoint.sh"]
CMD ["start"]