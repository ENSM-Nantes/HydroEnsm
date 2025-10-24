#!/bin/bash

#Dependencies
sudo apt install -y git gcc g++ make cmake gfortran pip python3 python3-pip liblapack-dev libblas-dev geany paraview tree
sudo snap install pycharm-community --classic

#Salome


#Clone CN-Aeromodels
if [ ! -d "CN-AeroModels" ]; then
    git clone https://gitlab.com/lheea/CN-AeroModels
fi

#Build CN-Aeromodels
cd CN-AeroModels
cmake -S. -Bbuild
cmake --build build
cd -

#Clone OpenFast
if [ ! -d "r-test" ]; then
    git clone https://github.com/OpenFAST/r-test
fi

if [ ! -d "openfast" ]; then
    git clone https://github.com/OpenFAST/openfast
fi
    
#Build OpenFast
cd openfast
mkdir -p build; cd build;
cmake ..
make openfast; make install
cd ../../


