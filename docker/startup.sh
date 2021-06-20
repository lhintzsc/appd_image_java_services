#!/bin/bash

#
# hard coded JVM parameter come here
#

#UNIQUE_HOST_ID=$(sed -rn '1s#.*/##; 1s/docker-(.{12}).*/\1/p' /proc/self/cgroup)
#JAVA_OPTS="$JAVA_OPTS -Xms64m -Xmx512m -XX:MaxPermSize=256m -Djava.net.preferIPv4Stack=true"
#JAVA_OPTS="$JAVA_OPTS -Djava.security.egd=file:/dev/./urandom"
#JAVA_OPTS="$JAVA_OPTS -Dappdynamics.agent.uniqueHostId=$UNIQUE_HOST_ID"
#JAVA_OPTS="$JAVA_OPTS javaagent:/opt/appd/java_agent/javaagent.jar"

#
# Start java app using JAVA_OPTS
#
echo $JAVA_OPTS

env

exec java $JAVA_OPTS -jar /java-services.jar
