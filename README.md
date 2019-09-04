#SBT in a Docker Container

Docker images that packages Java and [sbt](http://www.scala-sbt.org/). To be used
for builds.

Usage: `docker run linkyard/docker-sbt`

## Versions

* SBT: 1.3.0
* Java: JDK 12
* Scala (preinitialized): 2.12.9

## Details

* Uses the OpenJDK image as its base
* sbt is preinitialized, so running it for the first time will not take forever
* the compiler interfaces are already built, so the compilation will be reasonably fast
