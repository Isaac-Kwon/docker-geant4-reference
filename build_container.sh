#!/bin/sh

G4_VERSION=$1

docker build --build-arg buildDate=$(date +'%Y-%m-%d') --build-arg G4_VERSION=$G4_VERSION -t isaackwon/geant4-reference:$G4_VERSION .

