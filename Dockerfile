FROM debian:jessie-slim
MAINTAINER Michel Kraemer <michel.kraemer@igd.fraunhofer.de>

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    curl \
    groovy \
    mongodb-clients \
    s3cmd \
  && rm -rf /var/lib/apt/lists/*

RUN grape install org.apache.commons commons-exec 1.3

ENV JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/

ADD data /data
