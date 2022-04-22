#!/bin/sh
JAVA_HOME=${JAVA_HOME:-/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.322.b06-6.fc35.x86_64/jre}
PATH=$JAVA_HOME/bin:$PATH
echo $JAVA_HOME
echo $PATH
java -version
JAVA_HOME=$JAVA_HOME mvn -v
JAVA_HOME=$JAVA_HOME mvn clean install -DskipTests -Dmaven.javadoc.skip=true -Dno-chm -Dno-ehcache -Dno-jbosscache -Dno-zip -Dno-hazelcast -Dno-jgroups -Dno-redis -Dno-resteasy-http -Dno-spark -Dno-spymemcached -Dno-tomcat -Dno-etcd -Dno-docker -Dno-couchbase -Dno-eap -DskipTests -Dlog4j2