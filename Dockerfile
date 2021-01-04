FROM debian:buster-slim
MAINTAINER Michel Kraemer <michel.kraemer@igd.fraunhofer.de>

# see https://github.com/debuerreotype/docker-debian-artifacts/issues/24#issuecomment-360870939
RUN mkdir -p /usr/share/man/man1

RUN apt-get update \
  && apt-get install -y gnupg software-properties-common curl \
  && curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add - \
  && add-apt-repository 'deb https://repo.mongodb.org/apt/debian buster/mongodb-org/4.4 main' \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    groovy \
    mongodb-org-shell \
    python-pip \
  && rm -rf /var/lib/apt/lists/* \
  && pip install s3cmd

RUN grape install org.apache.commons commons-exec 1.3

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

ADD data /data
