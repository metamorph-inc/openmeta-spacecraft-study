# openmeta-spacecraft-study
An example OpenMETA model for the preliminary design of a spacecraft.

## Installation instructions

In addition to cloning this repository, you will need to install a number of software tools to be able to successfully run some of the test benches in this model.

### OpenModelica

OpenModelica is used to simulate the system dynamics of the spacecraft. To install OpenModelica you simply need to download and install the OpenModelica 1.9.2 version installer that is available [here](https://build.openmodelica.org/omc/builds/windows/releases/1.9/2/).

## Models

### OpenMETA Projects

The `CyPhy_Model` folder holds OpenMETA projects representing a Spacecraft.

The `ExampleSat_3_1.xme` and `ExampleSat3.3b.xme` projects are carbon copies of the work that has been done at Vanderbilt ISIS to develop the spacecraft model.

The `Spacecraft.xme` model includes some slight modifications to the `ExampleSat3.3b.xme` model to standardize naming conventions and model organization, but most significantly it seeks to replace all the Connectors in the model with instances of "Connector" archetypes in the Connectors folder; this was significant for trying to map these to SysML "Interface Blocks."

The `CargoSolarPanels.xme` project is used for the effort to demonstrate the ability to compose CAD and Sim Events models from within Cameo. *Note: This requires OpenMETA v0.18.5 or higher.*

### Cameo Projects

The `SysML_Model` folder contains two projects that correspond to those in the `CyPhy_Model` folder. The `Spacecraft.mdzip` model that corresponds to the `Spacecraft.xme` model. This model includes a number of SysML attempts to include functional and operational models in addition to the structural models that correspond to OpenMETA.

The `CargoSolarPanels.mdxml` project includes the most recent modeling strategies although it doesn't include the whole spacecraft. We are using this model for development of concepts/implementations currently.
