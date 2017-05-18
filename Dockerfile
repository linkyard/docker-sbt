FROM openjdk:8u121
MAINTAINER Mario Siegenthaler <mario.siegenthaler@linkyard.ch>

ENV SBT_VERSION 0.13.15

COPY enable-letsencrypt.sh /usr/local/enable-letsencrypt.sh
RUN /usr/local/enable-letsencrypt.sh $JAVA_HOME

RUN curl -sL "https://dl.bintray.com/sbt/native-packages/sbt/${SBT_VERSION}/sbt-${SBT_VERSION}.tgz" | \
    tar -xz -C /usr/local && \
    mv /usr/local/sbt-launcher-packaging-${SBT_VERSION} /usr/local/sbt

ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

# Already run sbt here - in the next steps we'll run it again, but they change more often
RUN sbt

# This will build the compiler interface (which is really slow)
# - for Scala 2.12
COPY init_scala-2.12 /tmp/init
RUN cd /tmp/init && \
    sbt test && \
    rm -rf /tmp/init
# - for Scala 2.11
COPY init_scala-2.11 /tmp/init
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
