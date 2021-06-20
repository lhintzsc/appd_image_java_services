#
# Sensitive data importated from local environmental variable
#

CONTROLLER=$APPD_CONTROLLER
ACCOUNT_NAME=$APPD_ACCOUNT_NAME
ACCOUNT_KEY=$APPD_ACCOUNT_KEY

#
# Set JVM parameter
#

JAVA_OPTS=""
JAVA_OPTS="$JAVA_OPTS -javaagent:/opt/appd/java_agent/javaagent.jar"
JAVA_OPTS="$JAVA_OPTS -Dappdynamics.controller.hostName=$CONTROLLER"
JAVA_OPTS="$JAVA_OPTS -Dappdynamics.controller.port=443"
JAVA_OPTS="$JAVA_OPTS -Dappdynamics.controller.ssl.enabled=true"
JAVA_OPTS="$JAVA_OPTS -Dappdynamics.agent.accountName=$ACCOUNT_NAME"
JAVA_OPTS="$JAVA_OPTS -Dappdynamics.agent.accountAccessKey=$ACCOUNT_KEY"
JAVA_OPTS="$JAVA_OPTS -Dappdynamics.agent.applicationName=LHINTZSC_JAVA"
JAVA_OPTS="$JAVA_OPTS -Dappdynamics.agent.tierName=java-service"
JAVA_OPTS="$JAVA_OPTS -Dappdynamics.agent.nodeName=java-service"
JAVA_OPTS="$JAVA_OPTS -Dappdynamics.agent.uniqueHostId=myLaptop"

echo $JAVA_OPTS

#
# Start Java program in container using custom JVM parameter
#

docker run \
	--env JAVA_OPTS="$JAVA_OPTS"\
	java-services-agent:latest &
