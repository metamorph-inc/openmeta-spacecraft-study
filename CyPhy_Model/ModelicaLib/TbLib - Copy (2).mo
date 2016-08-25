model TbLib
  model Src
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {0,40}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {0,40}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {0,-20}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {0,-20}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {-80,-40}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Electrical.Analog.Sources.RampVoltage rampvoltage1(V = 3.3, duration = 1) annotation(Placement(visible = true, transformation(origin = {-80,20}, extent = {{-20,-20},{20,20}}, rotation = -90)));
  equation
    connect(rampvoltage1.n,ground1.p) annotation(Line(points = {{-80,5.21805e-015},{-80,-30.4478},{-80,-30.4478},{-80,-30}}));
    connect(pin_n,rampvoltage1.n) annotation(Line(points = {{0,-20},{-80.1636,-20},{-80,10},{-80,5.21805e-015}}));
    connect(pin_p,rampvoltage1.p) annotation(Line(points = {{0,40},{-80.57259999999999,40},{-80,30},{-80,40}}));
    annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})));
  end Src;
  model TbLoad
    Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 4) annotation(Placement(visible = true, transformation(origin = {20,20}, extent = {{-10,-10},{10,10}}, rotation = -90)));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {-60,0}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {-60,0}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {-60,40}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {-60,20}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  equation
    connect(pin_p,resistor1.p) annotation(Line(points = {{-60,40},{-60.9407,40},{-60.9407,46.2168},{19.2229,46.2168},{19.2229,29.8569},{20,29.8569},{20,30}}));
    connect(pin_n,resistor1.n) annotation(Line(points = {{-60,0},{20.1661,0},{20.1661,9.80552},{20.1661,9.80552}}));
    annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})));
  end TbLoad;
  TbLib.TbLoad tbload1 annotation(Placement(visible = true, transformation(origin = {20,40}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  TbLib.Src src1 annotation(Placement(visible = true, transformation(origin = {-20,40}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  model Test
    Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {0,-40}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Blocks.Sources.SawTooth sawtooth1(period = 0.6, amplitude = 3) annotation(Placement(visible = true, transformation(origin = {-80,-40}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1(k2 = +1) annotation(Placement(visible = true, transformation(origin = {-55,-25}, extent = {{-5,-5},{5,5}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(visible = true, transformation(origin = {-80,-20}, extent = {{-5,-5},{5,5}}, rotation = 0)));
    Modelica.Electrical.Analog.Sources.SignalVoltage signalvoltage1 annotation(Placement(visible = true, transformation(origin = {0,0}, extent = {{-10,-10},{10,10}}, rotation = -90)));
    TbLib.DCDCIdeal dcdcideal1 annotation(Placement(visible = true, transformation(origin = {60,0}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Resistor resistor1 annotation(Placement(visible = true, transformation(origin = {220,20}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Resistor resistor2(R = 100) annotation(Placement(visible = true, transformation(origin = {80,-40}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  equation
    connect(dcdcideal1.OutN,resistor2.n) annotation(Line(points = {{70,-8},{90.93770000000001,-8},{90.93770000000001,-39.5587},{90.93770000000001,-39.5587}}));
    connect(resistor2.p,dcdcideal1.OutP) annotation(Line(points = {{70,-40},{69.5035,-40},{69.5035,-22.5374},{81.4815,-22.5374},{81.4815,7.72262},{70.134,7.72262},{70.134,7.72262}}));
    connect(dcdcideal1.InP,signalvoltage1.p) annotation(Line(points = {{50,8},{0.157604,8},{0.157604,9.29866},{0.157604,9.29866}}));
    connect(signalvoltage1.n,dcdcideal1.InN) annotation(Line(points = {{6.12303e-016,-10},{6.12303e-016,-8.35303},{50.591,-8.35303},{50.591,-8.35303}}));
    connect(signalvoltage1.n,ground1.p) annotation(Line(points = {{6.12303e-016,-10},{6.12303e-016,-30.3979},{-0.151233,-30.3979},{-0.151233,-30.3979}}));
    connect(add1.y,signalvoltage1.v) annotation(Line(points = {{-49.5,-25},{26.0121,-25},{26.0121,1.96603},{7.56166,1.96603},{7.56166,-0.6049330000000001},{7.56166,-0.6049330000000001}}));
    connect(sawtooth1.y,add1.u2) annotation(Line(points = {{-69,-40},{-65.93770000000001,-40},{-65.93770000000001,-28.2806},{-61.8544,-28.2806},{-61.8544,-28.2806}}));
    connect(const.y,add1.u1) annotation(Line(points = {{-74.5,-20},{-61.4007,-20},{-61.4007,-21.7776},{-61.4007,-21.7776}}));
    annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})));
  end Test;
  model PvSingleCell
    Modelica.Electrical.Analog.Sources.SignalCurrent signalcurrent1 annotation(Placement(visible = true, transformation(origin = {0,60}, extent = {{-7.5,-7.5},{7.5,7.5}}, rotation = 90)));
    Modelica.Blocks.Math.Gain gain1(k = 1) annotation(Placement(visible = true, transformation(origin = {-20,60}, extent = {{-5,-5},{5,5}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 0.01) annotation(Placement(visible = true, transformation(origin = {40,80}, extent = {{-5,-5},{5,5}}, rotation = 0)));
    Modelica.Electrical.Analog.Semiconductors.Diode diode1(Vt = 0.18) annotation(Placement(visible = true, transformation(origin = {20,60}, extent = {{-5,-5},{5,5}}, rotation = -90)));
    Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100,0}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {-100,60}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {100,100}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {60,80}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {100,-120}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {60,60}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Electrical.Analog.Ideal.IdealDiode idealdiode1 annotation(Placement(visible = true, transformation(origin = {60,80}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  equation
    connect(idealdiode1.n,pin_p) annotation(Line(points = {{70,80},{87.3977,80},{87.3977,98.1679},{99.75700000000001,98.1679},{99.75700000000001,98.1679}}));
    connect(idealdiode1.p,resistor1.n) annotation(Line(points = {{50,80},{45.3762,80},{45.3762,79.8056},{45.3762,79.8056}}));
    connect(signalcurrent1.p,pin_n) annotation(Line(points = {{-4.59227e-016,52.5},{-4.59227e-016,-0.866337},{58.2178,-120},{100,-120}}));
    connect(u,gain1.u) annotation(Line(points = {{-100,0},{-26.1796,0},{-26.1796,60},{-26,60}}));
    connect(diode1.p,resistor1.p) annotation(Line(points = {{20,65},{20,79.35639999999999},{35.3465,79.35639999999999},{35.3465,79.35639999999999}}));
    connect(signalcurrent1.p,diode1.n) annotation(Line(points = {{-4.59227e-016,52.5},{-4.59227e-016,51.1139},{20.4455,51.1139},{20.4455,55.099},{20.4455,55.099}}));
    connect(signalcurrent1.n,resistor1.p) annotation(Line(points = {{4.59227e-016,67.5},{4.59227e-016,79.2975},{34.5267,79.2975},{34.5267,80.4357},{34.5267,80.4357}}));
    connect(gain1.y,signalcurrent1.i) annotation(Line(points = {{-14.5,60},{-6.07062,60},{-6.07062,60.5165},{-6.07062,60.5165}}));
    annotation(Diagram(coordinateSystem(extent = {{-100,-120},{100,120}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Icon(coordinateSystem(extent = {{-100,-120},{100,120}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})));
  end PvSingleCell;
  model VarLoad
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {-80,-80}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {-80,0}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {-80,80}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {-80,40}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.VariableResistor variableresistor1 annotation(Placement(visible = true, transformation(origin = {0,0}, extent = {{-10,-10},{10,10}}, rotation = 90)));
    Modelica.Blocks.Sources.Pulse pulse1(amplitude = 50, width = 80, period = 1, offset = 5) annotation(Placement(visible = true, transformation(origin = {-60,0}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {20,-80}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  equation
    connect(pin_n,ground1.p) annotation(Line(points = {{-80,-80},{-8.421049999999999,-80},{-8.421049999999999,-70.0752},{19.2481,-70.0752},{19.2481,-70.0752}}));
    connect(pulse1.y,variableresistor1.R) annotation(Line(points = {{-49,0},{-11.1278,0},{-11.1278,0.9022559999999999},{-11.1278,0.9022559999999999}}));
    connect(variableresistor1.p,pin_n) annotation(Line(points = {{-6.12303e-016,-10},{-6.12303e-016,-79.3985},{-78.797,-79.3985},{-78.797,-79.0977},{-78.797,-79.0977}}));
    connect(pin_p,variableresistor1.n) annotation(Line(points = {{-80,80},{-0.300752,80},{-0.300752,9.62406},{-0.300752,9.62406},{-0.300752,9.62406}}));
    annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})));
  end VarLoad;
  model Test1
    TbLib.VarLoad varload1 annotation(Placement(visible = true, transformation(origin = {40,20}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    TbLib.SampleSolarFlux samplesolarflux1 annotation(Placement(visible = true, transformation(origin = {-80,20}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    TbLib.Solar_Panels_3 solar_panels_33 annotation(Placement(visible = true, transformation(origin = {-40,60}, extent = {{-15,-12},{10,12}}, rotation = 0)));
    TbLib.Solar_Panels_3 solar_panels_32 annotation(Placement(visible = true, transformation(origin = {-40,0}, extent = {{-15,-12},{10,12}}, rotation = 0)));
    TbLib.Solar_Panels_3 solar_panels_31 annotation(Placement(visible = true, transformation(origin = {-40,40}, extent = {{-15,-12},{10,12}}, rotation = 0)));
    TbLib.DCDCIdeal dcdcideal1 annotation(Placement(visible = true, transformation(origin = {60,20}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    TbLib.BattCapSurrogate battcapsurrogate1 annotation(Placement(visible = true, transformation(origin = {100,20}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  equation
    connect(battcapsurrogate1.pin_n,dcdcideal1.OutN) annotation(Line(points = {{90,12},{70.81619999999999,12},{70.81619999999999,11.744},{70.81619999999999,11.744}}));
    connect(dcdcideal1.OutP,battcapsurrogate1.pin_p) annotation(Line(points = {{70,28},{91.9554,28},{91.9554,27.7158},{91.9554,27.7158}}));
    connect(varload1.pin_p,dcdcideal1.InP) annotation(Line(points = {{32,24},{40.8646,24},{40.8646,28.6155},{50.3345,28.6155},{50.3345,28.6155}}));
    connect(varload1.pin_n,dcdcideal1.InN) annotation(Line(points = {{32,20},{39.8353,20},{39.8353,11.7344},{50.3345,11.7344},{50.3345,11.7344}}));
    connect(samplesolarflux1.y,solar_panels_31.u) annotation(Line(points = {{-76,24},{-68.2694,24},{-68.2694,45.513},{-49.5852,46},{-50,46}}));
    connect(solar_panels_31.pin_n,solar_panels_32.pin_p) annotation(Line(points = {{-30,34},{-34.2545,34},{-30,8.863049999999999},{-30,10}}));
    connect(solar_panels_31.pin_p,solar_panels_33.pin_n) annotation(Line(points = {{-30,50},{-25.73,50},{-25.73,54.2721},{-29.5263,54.2721},{-29.5263,54.2721}}));
    connect(samplesolarflux1.y,solar_panels_32.u) annotation(Line(points = {{-76,24},{-68.74850000000001,24},{-68.74850000000001,5.50946},{-49.5852,6},{-50,6}}));
    connect(solar_panels_32.pin_n,varload1.pin_n) annotation(Line(points = {{-30,-6},{29.4637,-6},{29.4637,19.4029},{32.8172,19.4029},{32.8172,19.4029}}));
    connect(samplesolarflux1.y,solar_panels_33.u) annotation(Line(points = {{-76,24},{-67.348,24},{-67.348,65.5202},{-50.0541,65.5202},{-50.0541,65.5202}}));
    connect(solar_panels_33.pin_p,varload1.pin_p) annotation(Line(points = {{-30,70},{32.1977,70},{32.1977,23.1992},{31.6353,23.1992},{31.6353,23.1992}}));
    annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})));
  end Test1;
  model SampleSolarFlux
    Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {40,40}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {40,40}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Blocks.Sources.Trapezoid trapezoid1(rising = 10, width = 50, falling = 10, period = 500) annotation(Placement(visible = true, transformation(origin = {-60,20}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  equation
    connect(trapezoid1.y,y) annotation(Line(points = {{-49,20},{9.107469999999999,20},{9.107469999999999,40.0729},{40,40.0729},{40,40}}));
    annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Line(origin = {-16.7577,-2.73226}, points = {{-73.224,98.1785},{-189.8,99.2714},{-189.8,-82.8779},{-63.0237,-83.2422},{-62.2951,98.9071},{-83.42440000000001,98.5428}})}));
  end SampleSolarFlux;
  model Solar_Panels_3
    Modelica.Electrical.Analog.Sources.SignalCurrent signalcurrent1 annotation(Placement(visible = true, transformation(origin = {0,60}, extent = {{-7.5,-7.5},{7.5,7.5}}, rotation = 90)));
    Modelica.Blocks.Math.Gain gain1(k = 1) annotation(Placement(visible = true, transformation(origin = {-20,60}, extent = {{-5,-5},{5,5}}, rotation = 0)));
    Modelica.Electrical.Analog.Semiconductors.Diode diode1(Vt = 0.18) annotation(Placement(visible = true, transformation(origin = {20,60}, extent = {{-5,-5},{5,5}}, rotation = -90)));
    Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-140,0}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {-100,60}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {100,-120}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {100,-60}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {100,120}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {100,100}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Electrical.Analog.Sources.SignalCurrent signalcurrent2 annotation(Placement(visible = true, transformation(origin = {0,0}, extent = {{-7.5,-7.5},{7.5,7.5}}, rotation = 90)));
    Modelica.Electrical.Analog.Semiconductors.Diode diode2(Vt = 0.18) annotation(Placement(visible = true, transformation(origin = {20,0}, extent = {{-5,-5},{5,5}}, rotation = -90)));
    Modelica.Electrical.Analog.Basic.Resistor resistor2(R = 0.01) annotation(Placement(visible = true, transformation(origin = {0,20}, extent = {{-5,-5},{5,5}}, rotation = 90)));
    Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 0.01) annotation(Placement(visible = true, transformation(origin = {40,80}, extent = {{-5,-5},{5,5}}, rotation = 0)));
  equation
    connect(resistor1.n,pin_p) annotation(Line(points = {{45,80},{60.6763,80},{60.6763,117.93},{100.505,117.93},{100.505,117.93}}));
    connect(signalcurrent1.n,resistor1.p) annotation(Line(points = {{4.59227e-016,67.5},{4.59227e-016,79.2975},{34.5267,79.2975},{35,80.4357},{35,80}}));
    connect(diode1.p,resistor1.p) annotation(Line(points = {{20,65},{20,79.35639999999999},{35.3465,80},{35,80}}));
    connect(signalcurrent2.p,pin_n) annotation(Line(points = {{-4.59227e-016,-7.5},{-4.59227e-016,-118.863},{98.9491,-118.863},{98.9491,-118.863}}));
    connect(resistor2.n,signalcurrent1.p) annotation(Line(points = {{3.06152e-016,25},{3.06152e-016,51.2168},{-0.395497,51.2168},{-0.395497,51.2168}}));
    connect(signalcurrent2.n,resistor2.p) annotation(Line(points = {{4.59227e-016,7.5},{4.59227e-016,14.6334},{-0.395497,14.6334},{-0.395497,14.6334}}));
    connect(diode2.n,signalcurrent2.p) annotation(Line(points = {{20,-5},{20,-13.0514},{0.395497,-13.0514},{0.395497,-7.31669},{-0.988741,-7.31669},{-0.988741,-7.31669}}));
    connect(signalcurrent2.n,diode2.p) annotation(Line(points = {{4.59227e-016,7.5},{4.59227e-016,9.957140000000001},{18.9808,9.957140000000001},{18.9808,3.73393},{18.9808,3.73393}}));
    connect(u,signalcurrent2.i) annotation(Line(points = {{-140,0},{-6.53438,0},{-6.53438,0},{-6.53438,0}}));
    connect(u,gain1.u) annotation(Line(points = {{-140,0},{-26.1796,0},{-26.1796,60},{-26,60}}));
    connect(signalcurrent1.p,diode1.n) annotation(Line(points = {{-4.59227e-016,52.5},{-4.59227e-016,51.1139},{20.4455,51.1139},{20.4455,55.099},{20.4455,55.099}}));
    connect(gain1.y,signalcurrent1.i) annotation(Line(points = {{-14.5,60},{-6.07062,60},{-6.07062,60.5165},{-6.07062,60.5165}}));
    annotation(Diagram(coordinateSystem(extent = {{-150,-120},{100,120}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Icon(coordinateSystem(extent = {{-150,-120},{100,120}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})));
  end Solar_Panels_3;
  model Gyroscope_Momentum_Control
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {-80,-80}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {-80,0}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {-80,80}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {-80,40}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.VariableResistor variableresistor1 annotation(Placement(visible = true, transformation(origin = {0,0}, extent = {{-10,-10},{10,10}}, rotation = 90)));
    Modelica.Blocks.Sources.Pulse pulse1(amplitude = 50, width = 80, period = 1, offset = 2) annotation(Placement(visible = true, transformation(origin = {-60,0}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {20,-80}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  equation
    connect(pin_n,ground1.p) annotation(Line(points = {{-80,-80},{-8.421049999999999,-80},{-8.421049999999999,-70.0752},{19.2481,-70.0752},{19.2481,-70.0752}}));
    connect(pulse1.y,variableresistor1.R) annotation(Line(points = {{-49,0},{-11.1278,0},{-11.1278,0.9022559999999999},{-11.1278,0.9022559999999999}}));
    connect(variableresistor1.p,pin_n) annotation(Line(points = {{-6.12303e-016,-10},{-6.12303e-016,-79.3985},{-78.797,-79.3985},{-78.797,-79.0977},{-78.797,-79.0977}}));
    connect(pin_p,variableresistor1.n) annotation(Line(points = {{-80,80},{-0.300752,80},{-0.300752,9.62406},{-0.300752,9.62406},{-0.300752,9.62406}}));
    annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})));
  end Gyroscope_Momentum_Control;
  model BattSurrogate
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {-100,-80}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {-100,-80}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {-100,80}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {-80,80}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica_EnergyStorages.Batteries.Cells.Basic.StaticResistance staticresistance1(cellParameters = Modelica_EnergyStorages.CellRecords.StaticResistance.Test1Parameters(), SOCini = 0.033) annotation(Placement(visible = true, transformation(origin = {-60,20}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  equation
    connect(staticresistance1.pin_n,pin_n) annotation(Line(points = {{-60,10},{-60.0266,10},{-60.0266,-79.68129999999999},{-99.07040000000001,-79.68129999999999},{-99.07040000000001,-79.68129999999999}}));
    connect(pin_p,staticresistance1.pin_p) annotation(Line(points = {{-100,80},{-59.4954,80},{-59.4954,29.4821},{-59.4954,29.4821},{-59.4954,29.4821}}));
    annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})));
  end BattSurrogate;
  model BattCapSurrogate
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {-100,-80}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {-100,-80}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {-100,80}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {-80,80}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 0.05) annotation(Placement(visible = true, transformation(origin = {-60,20}, extent = {{-10,-10},{10,10}}, rotation = -90)));
    Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = 100) annotation(Placement(visible = true, transformation(origin = {-60,-40}, extent = {{-10,-10},{10,10}}, rotation = -90)));
  equation
    connect(capacitor1.n,pin_n) annotation(Line(points = {{-60,-50},{-60,-80.5616},{-100.864,-80.5616},{-100.864,-80.5616}}));
    connect(capacitor1.p,resistor1.n) annotation(Line(points = {{-60,-30},{-60,11.6631},{-59.8272,11.6631},{-59.8272,10},{-60,10}}));
    connect(resistor1.p,pin_p) annotation(Line(points = {{-60,30},{-60,78.40170000000001},{-98.27209999999999,78.40170000000001},{-98.27209999999999,78.40170000000001}}));
    annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})));
  end BattCapSurrogate;
  model DCDCIdeal
    Modelica.Electrical.Analog.Interfaces.PositivePin InP annotation(Placement(visible = true, transformation(origin = {-100,80}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {-100,80}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin InN annotation(Placement(visible = true, transformation(origin = {-100,-80}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {-100,-80}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Electrical.Analog.Sensors.CurrentSensor OutputCurrent annotation(Placement(visible = true, transformation(origin = {40,60}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Electrical.Analog.Sources.SignalVoltage signalvoltage1 annotation(Placement(visible = true, transformation(origin = {20,20}, extent = {{-10,-10},{10,10}}, rotation = -90)));
    Modelica.Electrical.Analog.Interfaces.PositivePin OutP annotation(Placement(visible = true, transformation(origin = {100,80}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {100,80}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin OutN annotation(Placement(visible = true, transformation(origin = {100,-80}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {100,-80}, extent = {{-10,-10},{10,10}}, rotation = 0)));
    Modelica.Electrical.Analog.Sensors.VoltageSensor InputVoltage annotation(Placement(visible = true, transformation(origin = {-80,20}, extent = {{-10,-10},{10,10}}, rotation = -90)));
    Modelica.Electrical.Analog.Sources.SignalCurrent InputCurrent annotation(Placement(visible = true, transformation(origin = {-40,20}, extent = {{-10,-10},{10,10}}, rotation = -90)));
    Modelica.Blocks.Sources.Constant OutputVoltage(k = 5) annotation(Placement(visible = true, transformation(origin = {-15,75}, extent = {{-5,-5},{5,5}}, rotation = 0)));
    Modelica.Blocks.Math.Division division1 annotation(Placement(visible = true, transformation(origin = {40,-20}, extent = {{-5,-5},{5,5}}, rotation = 0)));
    Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {60,-40}, extent = {{-5,-5},{5,5}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay fixeddelay1(delayTime = 0.001) annotation(Placement(visible = true, transformation(origin = {80,-40}, extent = {{-5,-5},{5,5}}, rotation = 0)));
  equation
    connect(product1.y,fixeddelay1.u) annotation(Line(points = {{65.5,-40},{73.5001,-40},{73.5001,-40.2052},{73.5001,-40.2052}}));
    connect(fixeddelay1.y,InputCurrent.i) annotation(Line(points = {{85.5,-40},{92.22069999999999,-40},{92.22069999999999,-51.0104},{-13.5693,-51.0104},{-13.5693,19.6},{-33,19.6},{-33,20}}));
    connect(OutputVoltage.y,division1.u1) annotation(Line(points = {{-9.5,75},{0.251283,75},{0.251283,-17.2129},{33.9231,-17.2129},{33.9231,-17.2129}}));
    connect(InP,InputCurrent.p) annotation(Line(points = {{-100,80},{-40.3308,80},{-40.3308,30.2795},{-40.8334,30.2795},{-40.8334,30.2795}}));
    connect(OutputCurrent.i,product1.u1) annotation(Line(points = {{40,50},{39.6294,50},{39.6294,1.2352},{50.5404,1.2352},{50.5404,-37.0561},{53.4225,-37.0561},{53.4225,-37.0561}}));
    connect(division1.y,product1.u2) annotation(Line(points = {{45.5,-20},{47.0407,-20},{47.0407,-42.8204},{53.4225,-42.8204},{53.4225,-42.8204}}));
    connect(InputVoltage.v,division1.u2) annotation(Line(points = {{-90,20},{-90,-23.4689},{33.8652,-23.4689},{33.8652,-23.4689}}));
    connect(OutputVoltage.y,signalvoltage1.v) annotation(Line(points = {{-9.5,75},{0.514668,75},{0.514668,38.2913},{33.2476,38.2913},{33.2476,19.1457},{27,19.1457},{27,20}}));
    connect(InputVoltage.n,InN) annotation(Line(points = {{-80,10},{-80,-79.67059999999999},{-98.30159999999999,-79.67059999999999},{-98.30159999999999,-79.67059999999999}}));
    connect(InP,InputVoltage.p) annotation(Line(points = {{-100,80},{-80.1853,80},{-80.1853,30.8801},{-80.1853,30.8801}}));
    connect(OutputCurrent.n,OutP) annotation(Line(points = {{50,60},{76.47969999999999,60},{76.47969999999999,79.46469999999999},{100.154,79.46469999999999},{100.154,79.46469999999999}}));
    connect(OutN,signalvoltage1.n) annotation(Line(points = {{100,-80},{20.0721,-80},{20.0721,9.469889999999999},{20.0721,9.469889999999999}}));
    connect(signalvoltage1.p,OutputCurrent.p) annotation(Line(points = {{20,30},{20,59.7015},{30.1595,59.7015},{30.1595,59.7015}}));
    annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Line(origin = {164.507,114.722}, points = {{-236.221,0.594054},{-53.6171,0.594054}})}));
  end DCDCIdeal;
equation
  connect(tbload1.pin_n,src1.pin_n) annotation(Line(points = {{14,40},{-14.6172,40},{-14.6172,38.3207},{-19.753,38.3207},{-19.753,38.3207}}));
  connect(src1.pin_p,tbload1.pin_p) annotation(Line(points = {{-20,44},{12.5807,44},{12.5807,41.4422},{13.1357,41.4422},{13.1357,41.4422}}));
  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})));
end TbLib;