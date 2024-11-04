#!/usr/bin/env bash

set -o allexport; source bash.env; set +o allexport

echo 'Installing requirements'
apk upgrade && apk add openjdk11 && apk add unzip && apk add wget

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
