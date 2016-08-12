FROM debian
MAINTAINER Michel Kraemer <michel.kraemer@igd.fraunhofer.de>

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    curl \
    groovy \
    mongodb-clients \
    s3cmd \
  && rm -rf /var/lib/apt/lists/*

RUN grape install org.apache.commons commons-exec 1.3

ADD data /data
