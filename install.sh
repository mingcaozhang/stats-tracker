#!/bin/bash

read_inputs(){
  echo "This script will set up a simple Scala repository with sbt support."

  echo "Enter the project name:"
  read -r PROJECT_NAME

  echo "Enter Scala version [Default: 2.13.4]:"
  read -r SCALA_VERSION
  SCALA_VERSION=${SCALA_VERSION:-2.13.4}

  echo "Enter SBT version [Default: 1.4.7]:"
  read -r SBT_VERSION
  SBT_VERSION=${SBT_VERSION:-1.4.7}

  echo "Setting up project [$PROJECT_NAME] with Scala $SCALA_VERSION and SBT $SBT_VERSION"
}

generate_build_sbt(){
  touch build.sbt
  {
    echo "name := \"$PROJECT_NAME\""
    echo "version := \"0.1.0\""
    echo "scalaVersion := \"$SCALA_VERSION\""
    echo "sbtVersion := \"$SBT_VERSION\""
    echo "scalafmtOnCompile := true"
    echo "libraryDependencies ++= Dependencies.deps"
  } >> build.sbt

  git add build.sbt
  git commit -m "Generate build.sbt"
}

generate_readme(){
  rm README.md
  touch README.md
  {
    echo "#$PROJECT_NAME"
    echo "This project was created with https://github.com/mingcaozhang/scala-starter."
  } >> README.md
  git add README.md
  git commit -m "Generate README"
}

read_inputs
git clone https://github.com/mingcaozhang/scala-starter "$PROJECT_NAME"
cd "$PROJECT_NAME" || exit

generate_build_sbt
generate_readme

git remote remove origin
cd ..