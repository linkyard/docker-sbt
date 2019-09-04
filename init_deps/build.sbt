
scalaVersion := "2.12.9"

addCompilerPlugin("org.scalamacros" % "paradise" % "2.1.1" cross CrossVersion.patch)
addCompilerPlugin("org.typelevel" %% "kind-projector" % "0.10.3")
addCompilerPlugin("io.tryp" % "splain" % "0.4.1" cross CrossVersion.patch)
addCompilerPlugin("com.olegpy" %% "better-monadic-for" % "0.3.1")
