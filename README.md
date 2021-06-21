# Appd Container Image for an Example Java Service

This repository contains a very simple java service. The java is deployed with or without an appdynamics agent into a docker container.
The parameter of the agent can be either hard coded into the container startup script or introduced by using environment variables.

# Together with Network Vizibility

The java agent can be used together with a network vizibility agent that is likewise containerized. If a network vizibility container
is deployed as well, the optional environment varialbes must be set accordingly.


* export APPDYNAMICS_NETVIZ_AGENT_HOST=$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+')
* export APPDYNAMICS_NETVIZ_AGENT_PORT=3892

# Reference Documentation

* https://docs.appdynamics.com/21.1/en/application-monitoring/install-app-server-agents/java-agent/install-the-java-agent
* https://docs.appdynamics.com/21.5/en/application-monitoring/install-app-server-agents/java-agent/administer-the-java-agent/java-agent-configuration-properties
* https://docs.appdynamics.com/21.3/en/infrastructure-visibility/network-visibility/set-up-network-visibility-on-linux/install-the-network-agent-on-linux
