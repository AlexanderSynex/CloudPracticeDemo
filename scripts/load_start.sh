#!/usr/bin/env bash

echo "Configuring system"
set -o allexport; source bash.env; set +o allexport
DEBIAN_FRONTEND=noninteractive

echo 'Installing requirements'
apt-get update && apt-get upgrade -y \
    && apt-get install ca-certificates curl -y \
    && apt-get install openjdk-11-jdk[-headless] -y \
    && apt-get install unzip -y \
    && apt-get install wget -y \
    && apt-get install firefox -y

echo "Configuring docker"
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update

echo "Installing docker"
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

echo "Downloading runner from $RUNNER_URL"
wget -O runner.zip "$RUNNER_URL" && unzip runner.zip;

echo 'Installing runner'
mkdir $HOME/gitflic-runner;
mkdir -p $HOME/gitflic-runner/build $HOME/gitflic-runner/cache $HOME/gitflic-runner/data/log
cp runner.jar helper.jar $HOME/gitflic-runner
cp shell-scripts/helper.sh $HOME/gitflic-runner
sudo chmod +x $HOME/gitflic-runner/helper.sh

echo 'Registering runner'
java -jar runner.jar register --url "$GITFLIC_AGENT_URL" --registration-token "$GITFLIC_AGENT_TOKEN"

echo 'Configuring runner'
sed -i '1 i\runner.executor=shell\nlogging.file.name=data/log/server.log' config/application.properties

echo 'Starting runner'
java -jar runner.jar start --config=config/application.properties
