#!/bin/bash

#Dependencies
sudo apt install -y git gcc g++ make cmake gfortran pip python3 python3-pip liblapack-dev libblas-dev 

#Clone CN-Aeromodels
git clone https://gitlab.com/lheea/CN-AeroModels

#Build CN-Aeromodels
cd CN-AeroModels
cmake -S. -Bbuild
cmake --build build
cd -

#Clone OpenFast
git clone https://github.com/OpenFAST/r-test
git clone https://github.com/OpenFAST/openfast

#Build OpenFast
cd openfast
mkdir build; cd build;
cmake ..
make openfast; make install
cd ../../


