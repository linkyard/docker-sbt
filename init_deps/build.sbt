
scalaVersion := "2.12.4"

addCompilerPlugin("org.scalamacros" % "paradise" % "2.1.1" cross CrossVersion.patch)
addCompilerPlugin("org.spire-math" %% "kind-projector" % "0.9.4")
addCompilerPlugin("io.tryp" % "splain" % "0.2.7" cross CrossVersion.patch)

libraryDependencies += "org.typelevel" %% "cats-core" % "1.0.1"
libraryDependencies += "com.chuusai" %% "shapeless" % "2.3.3"
