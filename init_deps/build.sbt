
scalaVersion := "2.12.8"

addCompilerPlugin("org.scalamacros" % "paradise" % "2.1.1" cross CrossVersion.patch)
addCompilerPlugin("org.spire-math" %% "kind-projector" % "0.9.10")
addCompilerPlugin("io.tryp" % "splain" % "0.4.1" cross CrossVersion.patch)
addCompilerPlugin("com.olegpy" %% "better-monadic-for" % "0.3.0")
