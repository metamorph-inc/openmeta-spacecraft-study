# openmeta-spacecraft-study
An example OpenMETA model for the preliminary design of a spacecraft.

## Installation instructions

In addition to cloning this repository, you will need to install a number of software tools to be able to successfully run some of the test benches in this model.

### OpenModelica

OpenModelica is used to simulate the system dynamics of the spacecraft. To install OpenModelica you simply need to download and install the OpenModelica 1.9.2 version installer that is available [here](https://build.openmodelica.org/omc/builds/windows/releases/1.9/2/).

## Models

### OpenMETA Project

The `CyPhy_Model` folder holds the OpenMETA project representing a Spacecraft. The `Spacecraft.xme` model is based heavily on the work done at the Vanderbilt Institute for Software Integration and Systems to model a Spacecraft using the OpenMETA tools. The version found here makes some slight modifications to the original model to standardize naming conventions and model organization, but most significantly it seeks to replace all the Connectors in the model with instances of "Connector" archetypes in the Connectors folder; this was necessary for mapping them to SysML "Interface Blocks."

### Cameo Project

The `SysML_Model` folder contains a project `Spacecraft.mdzip` that corresponds to the one in the `CyPhy_Model` folder, `Spacecraft.xme`. This project includes a number of SysML functional and operational models in addition to the structural models that correspond to the OpenMETA project and components.
