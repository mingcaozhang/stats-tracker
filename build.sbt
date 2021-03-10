lazy val root = Project("scala-starter", file(".")).settings(
  name := "scala-starter",
  scalafmtOnCompile := true,
  libraryDependencies ++= Dependencies.deps
)
