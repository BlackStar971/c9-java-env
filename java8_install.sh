#!/bin/bash

echo 'Add OpenJDK repo'
echo 'deb http://ppa.launchpad.net/openjdk-r/ppa/ubuntu trusty main' | sudo tee -a /etc/apt/sourcess.list
sudo apt-get update
echo 'Install OpenJDK8'
sudo apt-get install -y openjdk-8-jdk

echo 'Remove default Java(Java7)'
sudo update-alternatives --remove java /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java

echo 'Set JAVA_HOME'
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> ~/.profile

echo 'Install SDKman'

curl -s "https://get.sdkman.io" | bash
source "/home/ubuntu/.sdkman/bin/sdkman-init.sh"
sdk install gradle

echo  'Install Gradle'
export GRADLE_HOME=/home/ubuntu/.sdkman/candidates/gradle/current
echo 'export GRADLE_HOME=/home/ubuntu/.sdkman/candidates/gradle/current' >> ~/.profile

echo 'Java8 development environment installation complete.'
echo 'If you would like to develop application,'
echo '$ gradle init --type java-library'
echo 'Library'
echo '$ gradle init --type java-application'
