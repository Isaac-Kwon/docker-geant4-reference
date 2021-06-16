FROM nginx:latest
MAINTAINER Minjae Kwon <"minjae.isaac.kwon@gmail.com">


ENV G4_VERSION 10.07.p02

RUN apt-get -y update;\
    apt-get install -y wget doxygen git python3;\
    apt-get clean;

RUN mkdir /usr/share/doxygen

WORKDIR /usr/share/doxygen

#https://geant4-data.web.cern.ch/releases/geant4.10.07.p02.tar.gz
RUN wget -q https://geant4-data.web.cern.ch/releases/geant4.${G4_VERSION}.tar.gz;\
    tar -xvf geant4.${G4_VERSION}.tar.gz -C /usr/share/doxygen;\
    rm geant4.${G4_VERSION}.tar.gz;

RUN git clone https://github.com/Isaac-Kwon/docker-geant4-reference.git .;\
    echo "PROJECT_NUMBER = ${G4_VERSION}" >> Doxyfile ;\
    echo "EXAMPLE_PATH   = /usr/share/geant4.${G4_VERSION}/examples" >> Doxyfile ;\
    echo "INPUT          = /usr/share/geant4.${G4_VERSION}/source" >> Doxyfile ;\
    doxygen Doxyfile;

WORKDIR /usr/share/nginx 