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

#
# Optional: configure network vizibility
#

#JAVA_OPTS="$JAVA_OPTS -Dappdynamics.netviz.host=$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+')"
#JAVA_OPTS="$JAVA_OPTS -Dappdynamics.netviz.port=3892"

export APPDYNAMICS_NETVIZ_AGENT_HOST=$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+')
export APPDYNAMICS_NETVIZ_AGENT_PORT=3892

#
# Start Java program in container using custom JVM parameter
#

echo $JAVA_OPTS

docker run \
  --env JAVA_OPTS="$JAVA_OPTS" \
  --env APPDYNAMICS_NETVIZ_AGENT_HOST="$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+')" \
  --env APPDYNAMICS_NETVIZ_AGENT_PORT="3892" \
  --publish 8080:8080 \
  java-services-agent:latest &
