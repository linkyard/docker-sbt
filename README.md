SBT in a Docker Container
=========================
Docker images that packages Java and [sbt](http://www.scala-sbt.org/). To be used
for builds.

Usage: `docker run linkyard/sbt`

Versions
--------
* SBT: 0.13.13
* Java: JDK 8

Details
-------
* Uses the OpenJDK image as its base
* sbt is preinitialized, so running it for the first time will not take forever
* the compiler interfaces are already built, so the compilation will be reasonably fast
