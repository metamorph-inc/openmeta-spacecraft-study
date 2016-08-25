within CyPhy.ComponentAssemblies;
model DC_Spacecraft_cfg1
  //Parameters
  parameter Real Batteries_x_Offset_From_Center=800;
  parameter Real Batteries_z_Offset_From_Center=200;
  parameter Real BatterySize=100;
  parameter Real Computers_x_Offset_From_Center=-600;
  parameter Real Computers_z_Offset_From_Center=-300;
  parameter Real Gyroscope_x_Offset_From_Center=0;
  parameter Real Gyroscope_z_Offset_From_Center=0;
  parameter Real GyroSize=1;
  parameter Real Inertia=1;
  parameter Real Panel_Angle=180;

  //Metrics
  //Environments

  //ComponentAssemblies

  //Components
  CyPhy.Components.RootFolder.A_Space_Components.Scenarios.attitudeScenario attitudeScenario annotation(choicesAllMatching=true, Placement(transformation(origin={15,-15}, extent={{-15,-15},{15,15}})));
  CyPhy.Components.RootFolder.A_Space_Components.Energy.Battery Batteries(
__CyPhy__CEquiv=BatterySize) annotation(choicesAllMatching=true, Placement(transformation(origin={56,-176}, extent={{-15,-15},{15,15}})));
  CyPhy.Components.RootFolder.A_Space_Components.CommunicationsAndCompute.Computer Computers(
    __CyPhy__Inertia=Inertia,
    __CyPhy__torqueGain=GyroSize) annotation(choicesAllMatching=true, Placement(transformation(origin={45,-239}, extent={{-15,-15},{15,15}})));
  CyPhy.Components.RootFolder.A_Space_Components.AttitudeControl.Gyroscope_Momentum_Control Gyroscope_Momentum_Control(
__CyPhy__powerRatio=GyroSize) annotation(choicesAllMatching=true, Placement(transformation(origin={43,-124}, extent={{-15,-15},{15,15}})));
  CyPhy.Components.RootFolder.A_Space_Components.Energy.Solar_Panels_3A Solar_Panels_A__Solar_Panels_3A(
__CyPhy__Angle_Between_Panels=Panel_Angle) annotation(choicesAllMatching=true, Placement(transformation(origin={257,-45}, extent={{-15,-15},{15,15}})));
  CyPhy.Components.RootFolder.A_Space_Components.Energy.Solar_Panels_3B Solar_Panels_B__Solar_Panels_3B(
__CyPhy__Angle_Between_Panels=Panel_Angle) annotation(choicesAllMatching=true, Placement(transformation(origin={15,-42}, extent={{-15,-15},{15,15}})));

  //Connectors
  Modelica.Blocks.Interfaces.RealOutput angle_actual__i annotation(Placement(transformation(origin={0,-0}, extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Interfaces.RealOutput angle_setpoint__i annotation(Placement(transformation(origin={0,-0}, extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Interfaces.RealOutput current_battery__i annotation(Placement(transformation(origin={0,-0}, extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Interfaces.RealOutput current_gyro__i annotation(Placement(transformation(origin={0,-0}, extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Interfaces.RealOutput current_solarCell__i annotation(Placement(transformation(origin={0,-0}, extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Interfaces.RealOutput voltage_bus__i annotation(Placement(transformation(origin={0,-0}, extent={{-20,-20},{20,20}})));
equation
  connect(angle_actual__i, Computers.angle) annotation(Line(points = {{0.0,0.0},{0.1,0.1}}));
  connect(angle_setpoint__i, attitudeScenario.y) annotation(Line(points = {{0.0,0.0},{0.1,0.1}}));
  connect(attitudeScenario.y, Computers.targetAngle) annotation(Line(points = {{0.0,0.0},{0.1,0.1}}));
  connect(Batteries.i, current_battery__i) annotation(Line(points = {{0.0,0.0},{0.1,0.1}}));
  connect(Batteries.pin_n, Computers.pin_n) annotation(Line(points = {{0.0,0.0},{0.1,0.1}},color={0,0,255}));
  connect(Batteries.pin_n, Gyroscope_Momentum_Control.pin_n) annotation(Line(points = {{0.0,0.0},{0.1,0.1}},color={0,0,255}));
  connect(Batteries.pin_p, Computers.pin_p) annotation(Line(points = {{0.0,0.0},{0.1,0.1}},color={0,0,255}));
  connect(Batteries.pin_p, Gyroscope_Momentum_Control.pin_p) annotation(Line(points = {{0.0,0.0},{0.1,0.1}},color={0,0,255}));
  connect(Computers.solarOut, Solar_Panels_B__Solar_Panels_3B.u) annotation(Line(points = {{0.0,0.0},{0.1,0.1}}));
  connect(Computers.torque, Gyroscope_Momentum_Control.torqueReq) annotation(Line(points = {{0.0,0.0},{0.1,0.1}}));
  connect(current_gyro__i, Gyroscope_Momentum_Control.i) annotation(Line(points = {{0.0,0.0},{0.1,0.1}}));
  connect(current_solarCell__i, Solar_Panels_A__Solar_Panels_3A.i) annotation(Line(points = {{0.0,0.0},{0.1,0.1}}));
  connect(Gyroscope_Momentum_Control.pin_n, Solar_Panels_B__Solar_Panels_3B.pin_n) annotation(Line(points = {{0.0,0.0},{0.1,0.1}},color={0,0,255}));
  connect(Gyroscope_Momentum_Control.pin_p, Solar_Panels_B__Solar_Panels_3B.pin_p) annotation(Line(points = {{0.0,0.0},{0.1,0.1}},color={0,0,255}));
  connect(Solar_Panels_A__Solar_Panels_3A.pin_n, Solar_Panels_B__Solar_Panels_3B.pin_n) annotation(Line(points = {{0.0,0.0},{0.1,0.1}},color={0,0,255}));
  connect(Solar_Panels_A__Solar_Panels_3A.pin_p, Solar_Panels_B__Solar_Panels_3B.pin_p) annotation(Line(points = {{0.0,0.0},{0.1,0.1}},color={0,0,255}));
  connect(Solar_Panels_A__Solar_Panels_3A.u, Solar_Panels_B__Solar_Panels_3B.u) annotation(Line(points = {{0.0,0.0},{0.1,0.1}}));
  connect(Solar_Panels_A__Solar_Panels_3A.v, voltage_bus__i) annotation(Line(points = {{0.0,0.0},{0.1,0.1}}));

 // Annotations
annotation (Icon(coordinateSystem(preserveAspectRatio=true,  extent={{0,-254},{272,0}}),
graphics={
Rectangle(extent={{0,0},{272,-254}},
lineColor={0,0,0},
fillColor={250,250,255},
fillPattern=FillPattern.Solid),
Polygon(points={{-40,-40},{-40,0},{0,0},{-40,-40}},
smooth=Smooth.None,
fillColor={0,127,0},
fillPattern=FillPattern.Solid,
pattern=LinePattern.None,
origin={0,40},
rotation=0,
lineColor={0,127,0}),
Polygon(points={{-40,-40},{-40,0},{0,0},{-40,-40}},
smooth=Smooth.None,
fillColor={0,127,0},
fillPattern=FillPattern.Solid,
pattern=LinePattern.None,
origin={272,-294},
rotation=180,
lineColor={0,127,0}),
Rectangle(
extent={{-40,50},{312,90}},
lineColor={0,127,0},
fillColor={0,127,0},
fillPattern=FillPattern.Solid),
Text(
extent={{-40,50},{312,90}},
lineColor={255,255,255},
textString="%name",
fontName="Comic Sans MS",
textStyle={TextStyle.Bold})}),
Diagram(coordinateSystem(
preserveAspectRatio=true,  extent={{0,-254},{272,0}})));
end DC_Spacecraft_cfg1;
