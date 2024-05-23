FROM openjdk:17-buster
LABEL maintainer="mario.siegenthaler@linkyard.ch"

ENV SBT_VERSION 1.10.0


# add deps
# - libatomic: needed by protoc
# - git: needed by sbt when we use source dependency
RUN apt-get update && \
    apt-get install -y libatomic1 git && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sL https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz | \
    tar -xz -C /usr/local

RUN useradd --create-home -s /bin/bash scala

ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

# This will build the compiler interface (which is really slow)
# - for Scala 2.13
COPY init_scala-2.13 /tmp/init
RUN cd /tmp/init && \
    sbt test && \
    rm -rf /tmp/init

#Run sbt once to initialize it along with commonly used dependencies
# = We trade a bigger image size against faster builds
COPY init_deps /tmp/init
RUN cd /tmp/init && \
    sbt test && \
    rm -rf /tmp/init


VOLUME /app
WORKDIR /app

CMD ["sbt"]
