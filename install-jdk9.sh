#!/bin/bash
wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/9.0.4+11/c2514751926b4512b076cc82f959763f/jdk-9.0.4_linux-x64_bin.tar.gz -O /opt/jdk.tar.gz
tar -xzvf /opt/jdk.tar.gz -C /opt/
export JAVA_HOME=/opt/jdk-9.0.4
update-alternatives  --install /usr/bin/java java /opt/jdk-9.0.4/bin/java 1000
update-alternatives  --install /usr/bin/javac javac /opt/jdk-9.0.4/bin/javac 1000
update-alternatives  --install /usr/bin/javap javap /opt/jdk-9.0.4/bin/javap 1000
update-alternatives  --install /usr/bin/javadoc javadoc /opt/jdk-9.0.4/bin/javadoc 1000
update-alternatives  --config java
rm -f /opt/jdk.tar.gz
java -version
