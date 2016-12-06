FROM openjdk:8u111
MAINTAINER Mario Siegenthaler <mario.siegenthaler@linkyard.ch>

ENV SBT_VERSION 0.13.13

RUN curl -sL "https://dl.bintray.com/sbt/native-packages/sbt/${SBT_VERSION}/sbt-${SBT_VERSION}.tgz" | \
    tar -xz -C /usr/local && \
    mv /usr/local/sbt-launcher-packaging-${SBT_VERSION} /usr/local/sbt

ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

# Run it to initialize the dependencies
RUN sbt

COPY init_scala-2.12 /tmp/init_scala-2.12
RUN cd /tmp/init_scala-2.12 && \
    sbt compile && \
    rm -rf /tmp/init_scala-2.12

VOLUME /app
WORKDIR /app

CMD ["sbt"]