within CyPhy.Components;
package RootFolder
extends Modelica.Icons.Package;
  package A_Space_Components
  extends Modelica.Icons.Package;
    package AttitudeControl
    extends Modelica.Icons.Package;
      model Gyroscope_Momentum_Control
        parameter Real __CyPhy__powerRatio=50;
        extends TbLib.Gyroscope_Momentum_Control(
          powerRatio=__CyPhy__powerRatio);
      end Gyroscope_Momentum_Control;
    end AttitudeControl;
    package CommunicationsAndCompute
    extends Modelica.Icons.Package;
      model Computer
        parameter Real __CyPhy__Inertia=1;
        parameter Real __CyPhy__PID_GainD=1;
        parameter Real __CyPhy__PID_GainP=1;
        parameter Real __CyPhy__torqueGain=1;
        extends TbLib.FullCtrl(
          ixx=__CyPhy__Inertia,
          pD=__CyPhy__PID_GainD,
          pP=__CyPhy__PID_GainP,
          torqueGain=__CyPhy__torqueGain);
      end Computer;
    end CommunicationsAndCompute;
    package Energy
    extends Modelica.Icons.Package;
      model Battery
        parameter Real __CyPhy__CEquiv=100;
        extends TbLib.BattCapSurrogate(
          CEquivalent=__CyPhy__CEquiv);
      end Battery;
      model Solar_Panels_3A
        parameter Real __CyPhy__Angle_Between_Panels=180;
        parameter Real __CyPhy__currentFactor=200;
        extends TbLib.Solar_Panels_3(
          currentFactor=__CyPhy__currentFactor);
      end Solar_Panels_3A;
      model Solar_Panels_3B
        parameter Real __CyPhy__Angle_Between_Panels=180;
        parameter Real __CyPhy__currentFactor=200;
        extends TbLib.Solar_Panels_3(
          currentFactor=__CyPhy__currentFactor);
      end Solar_Panels_3B;
    end Energy;
    package Scenarios
    extends Modelica.Icons.Package;
      model attitudeScenario
        extends TbLib.scenario;
      end attitudeScenario;
    end Scenarios;
  end A_Space_Components;
end RootFolder;
