within CyPhy.TestBenches;
model DC_Spacecraft_4444
  //Parameters

  //Metrics
  // Only PostProcessing Metrics supported at this time.
  // Only PostProcessing Metrics supported at this time.
  // Only PostProcessing Metrics supported at this time.
  // Only PostProcessing Metrics supported at this time.

  //Environments

  //ComponentAssemblies
   CyPhy.ComponentAssemblies.DC_Spacecraft_cfg1 DC_Spacecraft_cfg1 annotation(Placement(transformation(origin={45,-30}, extent={{-15,-15},{15,15}})));

  //TestComponents
equation

 // Annotations
annotation (Documentation(info="<HTML><p>Generated test bench from CyPhy using the META tools. Tool Version: 14.13.2554 Interpreter Version: CyPhy2Modelica_v2, Version=1.0.0.0, Culture=neutral, PublicKeyToken=d71a19957c0c6396</p></HTML>"),experiment(StartTime=0, StopTime=10000, Algorithm="dassl"),
Icon(coordinateSystem(preserveAspectRatio=true, extent={{0,-60},{90,0}}),
  graphics={
    Line(
      points={{15,-33},{25.5,-45},{43.5,-15}},
      color={0,255,0},
      smooth=Smooth.None,
      thickness=0.5),
    Line(
      points={{45,-45},{75,-15}},
      color={255,0,0},
      smooth=Smooth.None,
      thickness=0.5),
    Line(
      points={{45,-15},{75,-45}},
      color={255,0,0},
      smooth=Smooth.None,
      thickness=0.5)}),
  Diagram(coordinateSystem(preserveAspectRatio=true, extent={{0,-60},{90,0}})));
end DC_Spacecraft_4444;
