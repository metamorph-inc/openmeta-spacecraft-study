model TbLib
  model Src
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {-80, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Sources.RampVoltage rampvoltage1(V = 3.3, duration = 1) annotation(Placement(visible = true, transformation(origin = {-80, 20}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  equation
    connect(rampvoltage1.n, ground1.p) annotation(Line(points = {{-80, 5.21805e-015}, {-80, -30.4478}, {-80, -30.4478}, {-80, -30}}));
    connect(pin_n, rampvoltage1.n) annotation(Line(points = {{0, -20}, {-80.1636, -20}, {-80, 10}, {-80, 5.21805e-015}}));
    connect(pin_p, rampvoltage1.p) annotation(Line(points = {{0, 40}, {-80.57259999999999, 40}, {-80, 30}, {-80, 40}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end Src;

  TbLib.TbLoad tbload1 annotation(Placement(visible = true, transformation(origin = {20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TbLib.Src src1 annotation(Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  model Test
    Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.SawTooth sawtooth1(period = 0.6, amplitude = 3) annotation(Placement(visible = true, transformation(origin = {-80, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1(k2 = +1) annotation(Placement(visible = true, transformation(origin = {-55, -25}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(visible = true, transformation(origin = {-80, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Electrical.Analog.Sources.SignalVoltage signalvoltage1 annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    TbLib.DCDCIdeal dcdcideal1 annotation(Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Resistor resistor1 annotation(Placement(visible = true, transformation(origin = {220, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Resistor resistor2(R = 100) annotation(Placement(visible = true, transformation(origin = {80, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(dcdcideal1.OutN, resistor2.n) annotation(Line(points = {{70, -8}, {90.93770000000001, -8}, {90.93770000000001, -39.5587}, {90.93770000000001, -39.5587}}));
    connect(resistor2.p, dcdcideal1.OutP) annotation(Line(points = {{70, -40}, {69.5035, -40}, {69.5035, -22.5374}, {81.4815, -22.5374}, {81.4815, 7.72262}, {70.134, 7.72262}, {70.134, 7.72262}}));
    connect(dcdcideal1.InP, signalvoltage1.p) annotation(Line(points = {{50, 8}, {0.157604, 8}, {0.157604, 9.29866}, {0.157604, 9.29866}}));
    connect(signalvoltage1.n, dcdcideal1.InN) annotation(Line(points = {{6.12303e-016, -10}, {6.12303e-016, -8.35303}, {50.591, -8.35303}, {50.591, -8.35303}}));
    connect(signalvoltage1.n, ground1.p) annotation(Line(points = {{6.12303e-016, -10}, {6.12303e-016, -30.3979}, {-0.151233, -30.3979}, {-0.151233, -30.3979}}));
    connect(add1.y, signalvoltage1.v) annotation(Line(points = {{-49.5, -25}, {26.0121, -25}, {26.0121, 1.96603}, {7.56166, 1.96603}, {7.56166, -0.6049330000000001}, {7.56166, -0.6049330000000001}}));
    connect(sawtooth1.y, add1.u2) annotation(Line(points = {{-69, -40}, {-65.93770000000001, -40}, {-65.93770000000001, -28.2806}, {-61.8544, -28.2806}, {-61.8544, -28.2806}}));
    connect(const.y, add1.u1) annotation(Line(points = {{-74.5, -20}, {-61.4007, -20}, {-61.4007, -21.7776}, {-61.4007, -21.7776}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end Test;

  model PvSingleCell
    Modelica.Electrical.Analog.Sources.SignalCurrent signalcurrent1 annotation(Placement(visible = true, transformation(origin = {0, 60}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 90)));
    Modelica.Blocks.Math.Gain gain1(k = 1) annotation(Placement(visible = true, transformation(origin = {-20, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 0.01) annotation(Placement(visible = true, transformation(origin = {40, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Electrical.Analog.Semiconductors.Diode diode1(Vt = 0.18) annotation(Placement(visible = true, transformation(origin = {20, 60}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
    Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {100, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Ideal.IdealDiode idealdiode1 annotation(Placement(visible = true, transformation(origin = {60, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Sensors.VoltageSensor voltagesensor1 annotation(Placement(visible = true, transformation(origin = {60, 20}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
    Modelica.Electrical.Analog.Sensors.CurrentSensor currentsensor1 annotation(Placement(visible = true, transformation(origin = {60, 100}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput v annotation(Placement(visible = true, transformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput i annotation(Placement(visible = true, transformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(currentsensor1.i, i) annotation(Line(points = {{60, 95}, {75.2013, 95}, {75.2013, 39.2107}, {90.9234, 39.2107}, {90.9234, 39.2107}}));
    connect(voltagesensor1.v, v) annotation(Line(points = {{70, 20}, {70, 20.2684}, {75.3907, 20.2684}, {75.3907, -60.4262}, {91.6811, -60.4262}, {91.6811, -60.4262}}));
    connect(currentsensor1.p, idealdiode1.n) annotation(Line(points = {{55, 100}, {52.8493, 100}, {52.8493, 91.1129}, {69.708, 91.1129}, {69.708, 80.1263}, {69.708, 80.1263}}));
    connect(pin_p, currentsensor1.n) annotation(Line(points = {{100, 100}, {65.1618, 100}, {65.1618, 100.963}, {65.35120000000001, 100.963}, {65.35120000000001, 99.6369}, {65.35120000000001, 99.6369}}));
    connect(voltagesensor1.n, pin_n) annotation(Line(points = {{60, 10}, {60, -115.549}, {97.17440000000001, -115.549}, {97.17440000000001, -118.769}, {97.17440000000001, -118.769}}));
    connect(voltagesensor1.p, pin_p) annotation(Line(points = {{60, 30}, {60, 61.7522}, {81.2628, 61.7522}, {81.2628, 99.6369}, {98.1215, 99.6369}, {98.1215, 99.6369}}));
    connect(idealdiode1.p, resistor1.n) annotation(Line(points = {{50, 80}, {45.3762, 80}, {45.3762, 79.8056}, {45.3762, 79.8056}}));
    connect(signalcurrent1.p, pin_n) annotation(Line(points = {{-4.59227e-016, 52.5}, {-4.59227e-016, -0.866337}, {58.2178, -120}, {100, -120}}));
    connect(u, gain1.u) annotation(Line(points = {{-100, 0}, {-26.1796, 0}, {-26.1796, 60}, {-26, 60}}));
    connect(diode1.p, resistor1.p) annotation(Line(points = {{20, 65}, {20, 79.35639999999999}, {35.3465, 79.35639999999999}, {35.3465, 79.35639999999999}}));
    connect(signalcurrent1.p, diode1.n) annotation(Line(points = {{-4.59227e-016, 52.5}, {-4.59227e-016, 51.1139}, {20.4455, 51.1139}, {20.4455, 55.099}, {20.4455, 55.099}}));
    connect(signalcurrent1.n, resistor1.p) annotation(Line(points = {{4.59227e-016, 67.5}, {4.59227e-016, 79.2975}, {34.5267, 79.2975}, {34.5267, 80.4357}, {34.5267, 80.4357}}));
    connect(gain1.y, signalcurrent1.i) annotation(Line(points = {{-14.5, 60}, {-6.07062, 60}, {-6.07062, 60.5165}, {-6.07062, 60.5165}}));
    annotation(Diagram(coordinateSystem(extent = {{-100, -120}, {100, 120}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -120}, {100, 120}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end PvSingleCell;

  model VarLoad
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {-80, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.VariableResistor variableresistor1 annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    Modelica.Blocks.Sources.Pulse pulse1(amplitude = 50, width = 80, period = 1, offset = 5) annotation(Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {20, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Sensors.VoltageSensor voltagesensor1 annotation(Placement(visible = true, transformation(origin = {40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    Modelica.Electrical.Analog.Sensors.CurrentSensor currentsensor1 annotation(Placement(visible = true, transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    output Modelica.Blocks.Interfaces.RealOutput v annotation(Placement(visible = true, transformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    output Modelica.Blocks.Interfaces.RealOutput i annotation(Placement(visible = true, transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(voltagesensor1.v, v) annotation(Line(points = {{50, 20}, {50, -80.06789999999999}, {92.62090000000001, -80.06789999999999}, {92.62090000000001, -80.06789999999999}}));
    connect(currentsensor1.i, i) annotation(Line(points = {{10, 40}, {10, 39.3554}, {77.25190000000001, 80}, {100, 80}}));
    connect(currentsensor1.p, variableresistor1.n) annotation(Line(points = {{-6.12303e-016, 30}, {-6.12303e-016, 9.838850000000001}, {0, 9.838850000000001}, {0, 9.838850000000001}}));
    connect(pin_p, currentsensor1.n) annotation(Line(points = {{-80, 80}, {0.6785409999999999, 80}, {0.6785409999999999, 49.5335}, {0.6785409999999999, 49.5335}}));
    connect(voltagesensor1.p, pin_n) annotation(Line(points = {{40, 10}, {40, -80.06789999999999}, {-80.74639999999999, -80.06789999999999}, {-80.74639999999999, -80.06789999999999}}));
    connect(pin_p, voltagesensor1.n) annotation(Line(points = {{-80, 80}, {40.0339, 80}, {40.0339, 29.5165}, {40.0339, 29.5165}}));
    connect(pin_n, ground1.p) annotation(Line(points = {{-80, -80}, {-8.421049999999999, -80}, {-8.421049999999999, -70.0752}, {19.2481, -70.0752}, {19.2481, -70.0752}}));
    connect(pulse1.y, variableresistor1.R) annotation(Line(points = {{-49, 0}, {-11.1278, 0}, {-11.1278, 0.9022559999999999}, {-11.1278, 0.9022559999999999}}));
    connect(variableresistor1.p, pin_n) annotation(Line(points = {{-6.12303e-016, -10}, {-6.12303e-016, -79.3985}, {-78.797, -79.3985}, {-78.797, -79.0977}, {-78.797, -79.0977}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end VarLoad;

  model Test1
    TbLib.VarLoad varload1 annotation(Placement(visible = true, transformation(origin = {40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TbLib.SampleSolarFlux samplesolarflux1 annotation(Placement(visible = true, transformation(origin = {-84, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TbLib.Solar_Panels_3 solar_panels_33 annotation(Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-15, -12}, {10, 12}}, rotation = 0)));
    TbLib.Solar_Panels_3 solar_panels_32 annotation(Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-15, -12}, {10, 12}}, rotation = 0)));
    TbLib.Solar_Panels_3 solar_panels_31 annotation(Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-15, -12}, {10, 12}}, rotation = 0)));
    TbLib.BattCapSurrogate battcapsurrogate1 annotation(Placement(visible = true, transformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(varload1.pin_n, battcapsurrogate1.pin_n) annotation(Line(points = {{32, 20}, {32.2581, 20}, {32.2581, -15.0538}, {89.6057, -15.0538}, {89.6057, 11.7085}, {90, 11.7085}, {90, 12}}));
    connect(battcapsurrogate1.pin_p, varload1.pin_p) annotation(Line(points = {{92, 28}, {83.871, 28}, {83.871, 37.037}, {32.736, 37.037}, {32.736, 24}, {32, 24}}));
    connect(samplesolarflux1.y, solar_panels_31.u) annotation(Line(points = {{-80, 14}, {-68.2694, 14}, {-68.2694, 45.513}, {-50, 45.513}, {-50, 46}}));
    connect(solar_panels_31.pin_n, solar_panels_32.pin_p) annotation(Line(points = {{-30, 34}, {-34.2545, 34}, {-30, 8.863049999999999}, {-30, 10}}));
    connect(solar_panels_31.pin_p, solar_panels_33.pin_n) annotation(Line(points = {{-30, 50}, {-25.73, 50}, {-25.73, 54.2721}, {-30, 54.2721}, {-30, 54}}));
    connect(samplesolarflux1.y, solar_panels_32.u) annotation(Line(points = {{-80, 14}, {-68.74850000000001, 14}, {-68.74850000000001, 5.50946}, {-50, 5.50946}, {-50, 6}}));
    connect(solar_panels_32.pin_n, varload1.pin_n) annotation(Line(points = {{-30, -6}, {29.4637, -6}, {29.4637, 19.4029}, {32, 19.4029}, {32, 20}}));
    connect(samplesolarflux1.y, solar_panels_33.u) annotation(Line(points = {{-80, 14}, {-67.348, 14}, {-67.348, 65.5202}, {-50, 65.5202}, {-50, 66}}));
    connect(solar_panels_33.pin_p, varload1.pin_p) annotation(Line(points = {{-30, 70}, {32.1977, 70}, {32.1977, 23.1992}, {32, 23.1992}, {32, 24}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end Test1;

  model SampleSolarFlux
    Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Trapezoid trapezoid1(rising = 10, width = 50, falling = 10, period = 500) annotation(Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(trapezoid1.y, y) annotation(Line(points = {{-49, 20}, {9.107469999999999, 20}, {9.107469999999999, 40.0729}, {40, 40.0729}, {40, 40}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Line(origin = {-16.7577, -2.73226}, points = {{-73.224, 98.1785}, {-189.8, 99.2714}, {-189.8, -82.8779}, {-63.0237, -83.2422}, {-62.2951, 98.9071}, {-83.42440000000001, 98.5428}})}));
  end SampleSolarFlux;

  model Solar_Panels_3
    parameter Real currentFactor;
    Modelica.Electrical.Analog.Sources.SignalCurrent signalcurrent1 annotation(Placement(visible = true, transformation(origin = {0, 60}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 90)));
    Modelica.Electrical.Analog.Semiconductors.Diode diode1(Vt = 0.18) annotation(Placement(visible = true, transformation(origin = {20, 60}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
    Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-140, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {100, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {100, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Sources.SignalCurrent signalcurrent2 annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 90)));
    Modelica.Electrical.Analog.Semiconductors.Diode diode2(Vt = 0.18) annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
    Modelica.Electrical.Analog.Basic.Resistor resistor2(R = 0.01) annotation(Placement(visible = true, transformation(origin = {0, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
    Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 0.01) annotation(Placement(visible = true, transformation(origin = {40, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Electrical.Analog.Sensors.VoltageSensor voltagesensor1 annotation(Placement(visible = true, transformation(origin = {40, -40}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
    Modelica.Electrical.Analog.Sensors.CurrentSensor currentsensor1 annotation(Placement(visible = true, transformation(origin = {60, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    Modelica.Blocks.Interfaces.RealOutput i annotation(Placement(visible = true, transformation(origin = {100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput v annotation(Placement(visible = true, transformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain1(k = currentFactor) annotation(Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  equation
    connect(gain1.y, signalcurrent2.i) annotation(Line(points = {{-34.5, 60}, {-20.7455, 60}, {-20.7455, -0.259319}, {-5.70502, -0.259319}, {-5.70502, -0.259319}}));
    connect(u, gain1.u) annotation(Line(points = {{-140, 0}, {-92.3177, 0}, {-92.3177, 60.4214}, {-46.4182, 60.4214}, {-46.4182, 60.4214}}));
    connect(gain1.y, signalcurrent1.i) annotation(Line(points = {{-34.5, 60}, {-6.07062, 60}, {-6.07062, 60.5165}, {-6.07062, 60.5165}}));
    connect(voltagesensor1.v, v) annotation(Line(points = {{50, -40}, {50, -39.4911}, {74.9109, -39.4911}, {74.9109, -80.61069999999999}, {92.4173, -80.61069999999999}, {92.4173, -80.61069999999999}}));
    connect(currentsensor1.i, i) annotation(Line(points = {{70, 100}, {70, 96.0814}, {85.0891, 96.0814}, {85.0891, 60.6616}, {92.8244, 60.6616}, {92.8244, 60.6616}}));
    connect(currentsensor1.p, resistor1.n) annotation(Line(points = {{60, 90}, {60, 80.20359999999999}, {44.7837, 80.20359999999999}, {44.7837, 80.20359999999999}}));
    connect(pin_p, currentsensor1.n) annotation(Line(points = {{100, 120}, {60.2545, 120}, {60.2545, 109.924}, {60.2545, 109.924}}));
    connect(voltagesensor1.n, pin_n) annotation(Line(points = {{40, -50}, {40, -119.695}, {101.374, -119.695}, {101.374, -119.695}}));
    connect(pin_p, voltagesensor1.p) annotation(Line(points = {{100, 120}, {79.38930000000001, 120}, {79.38930000000001, -30.1272}, {40.3053, -30.1272}, {40.3053, -30.1272}}));
    connect(signalcurrent1.n, resistor1.p) annotation(Line(points = {{4.59227e-016, 67.5}, {4.59227e-016, 79.2975}, {34.5267, 79.2975}, {35, 80.4357}, {35, 80}}));
    connect(diode1.p, resistor1.p) annotation(Line(points = {{20, 65}, {20, 79.35639999999999}, {35.3465, 80}, {35, 80}}));
    connect(signalcurrent2.p, pin_n) annotation(Line(points = {{-4.59227e-016, -7.5}, {-4.59227e-016, -118.863}, {98.9491, -118.863}, {98.9491, -118.863}}));
    connect(resistor2.n, signalcurrent1.p) annotation(Line(points = {{3.06152e-016, 25}, {3.06152e-016, 51.2168}, {-0.395497, 51.2168}, {-0.395497, 51.2168}}));
    connect(signalcurrent2.n, resistor2.p) annotation(Line(points = {{4.59227e-016, 7.5}, {4.59227e-016, 14.6334}, {-0.395497, 14.6334}, {-0.395497, 14.6334}}));
    connect(diode2.n, signalcurrent2.p) annotation(Line(points = {{20, -5}, {20, -13.0514}, {0.395497, -13.0514}, {0.395497, -7.31669}, {-0.988741, -7.31669}, {-0.988741, -7.31669}}));
    connect(signalcurrent2.n, diode2.p) annotation(Line(points = {{4.59227e-016, 7.5}, {4.59227e-016, 9.957140000000001}, {18.9808, 9.957140000000001}, {18.9808, 3.73393}, {18.9808, 3.73393}}));
    connect(signalcurrent1.p, diode1.n) annotation(Line(points = {{-4.59227e-016, 52.5}, {-4.59227e-016, 51.1139}, {20.4455, 51.1139}, {20.4455, 55.099}, {20.4455, 55.099}}));
    annotation(Diagram(coordinateSystem(extent = {{-150, -120}, {100, 120}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-150, -120}, {100, 120}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end Solar_Panels_3;

  model Gyroscope_Momentum_Control
    parameter Real powerRatio = 1;
    Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {20, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput torqueReq annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Abs abs1 annotation(Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {80, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Sources.SignalCurrent signalcurrent1 annotation(Placement(visible = true, transformation(origin = {60, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
    Modelica.Electrical.Analog.Sensors.CurrentSensor currentsensor1 annotation(Placement(visible = true, transformation(origin = {40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput i annotation(Placement(visible = true, transformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain1(k = powerRatio * 50) annotation(Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  equation
    connect(gain1.y, signalcurrent1.i) annotation(Line(points = {{-3.5, 0}, {51.3957, 0}, {51.3957, 0.985222}, {51.3957, 0.985222}}));
    connect(abs1.y, gain1.u) annotation(Line(points = {{-49, 0}, {-32.8407, 0}, {-38, -0.164204}, {-38, 0}}));
    connect(i, currentsensor1.i) annotation(Line(points = {{100, 20}, {40.5797, 20}, {40.5797, 49.8856}, {40.5797, 49.8856}, {40.5797, 49.8856}}));
    connect(currentsensor1.p, signalcurrent1.p) annotation(Line(points = {{30, 60}, {24.1037, 60}, {24.1037, 10.5263}, {59.0389, 10.5263}, {59.0389, 10.5263}}));
    connect(pin_p, currentsensor1.n) annotation(Line(points = {{80, 80}, {63.1579, 80}, {63.1579, 60.2593}, {50.4958, 60.2593}, {50.4958, 60.2593}}));
    connect(signalcurrent1.n, pin_n) annotation(Line(points = {{60, -10}, {60, -79.803}, {79.6388, -79.803}, {79.6388, -79.803}}));
    connect(pin_n, ground1.p) annotation(Line(points = {{80, -80}, {-8.421049999999999, -80}, {-8.421049999999999, -70.0752}, {19.2481, -70.0752}, {19.2481, -70.0752}}));
    connect(torqueReq, abs1.u) annotation(Line(points = {{-100, 0}, {-72.10299999999999, 0}, {-72.10299999999999, 1.14449}, {-72.10299999999999, 1.14449}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end Gyroscope_Momentum_Control;

  model BattSurrogate
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica_EnergyStorages.Batteries.Cells.Basic.StaticResistance staticresistance1(cellParameters = Modelica_EnergyStorages.CellRecords.StaticResistance.Test1Parameters(), SOCini = 0.033) annotation(Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(staticresistance1.pin_n, pin_n) annotation(Line(points = {{-60, 10}, {-60.0266, 10}, {-60.0266, -79.68129999999999}, {-99.07040000000001, -79.68129999999999}, {-99.07040000000001, -79.68129999999999}}));
    connect(pin_p, staticresistance1.pin_p) annotation(Line(points = {{-100, 80}, {-59.4954, 80}, {-59.4954, 29.4821}, {-59.4954, 29.4821}, {-59.4954, 29.4821}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end BattSurrogate;

  model BattCapSurrogate
    parameter Real CEquivalent = 100;
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 0.05) annotation(Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = CEquivalent) annotation(Placement(visible = true, transformation(origin = {-60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Sensors.CurrentSensor currentsensor1 annotation(Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Sensors.VoltageSensor voltagesensor1 annotation(Placement(visible = true, transformation(origin = {40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput i annotation(Placement(visible = true, transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput v annotation(Placement(visible = true, transformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(currentsensor1.i, i) annotation(Line(points = {{-40, 50}, {-40.3732, 50}, {-40.3732, 49.1942}, {6.78541, 49.1942}, {6.78541, 91.6031}, {79.05, 91.6031}, {79.05, 79.05}, {93.97790000000001, 79.05}, {93.97790000000001, 79.05}}));
    connect(voltagesensor1.v, v) annotation(Line(points = {{40, 50}, {40.3732, 50}, {40.3732, -88.2103}, {80.4071, -88.2103}, {80.4071, -79.38930000000001}, {91.9423, -79.38930000000001}, {91.9423, -79.38930000000001}}));
    connect(voltagesensor1.n, pin_n) annotation(Line(points = {{50, 60}, {54.6226, 60}, {54.6226, -81.0857}, {-98.0492, -81.0857}, {-98.0492, -81.0857}}));
    connect(pin_p, voltagesensor1.p) annotation(Line(points = {{-100, 80}, {29.8558, 80}, {29.8558, 60.7294}, {29.8558, 60.7294}}));
    connect(currentsensor1.p, resistor1.p) annotation(Line(points = {{-50, 60}, {-60.0509, 60}, {-60.0509, 29.1773}, {-59.0331, 29.1773}, {-59.0331, 29.1773}}));
    connect(pin_p, currentsensor1.n) annotation(Line(points = {{-100, 80}, {-26.4631, 80}, {-26.4631, 60.3902}, {-29.1773, 60.3902}, {-29.1773, 60.3902}}));
    connect(capacitor1.n, pin_n) annotation(Line(points = {{-60, -50}, {-60, -80.5616}, {-100.864, -80.5616}, {-100.864, -80.5616}}));
    connect(capacitor1.p, resistor1.n) annotation(Line(points = {{-60, -30}, {-60, 11.6631}, {-59.8272, 11.6631}, {-59.8272, 10}, {-60, 10}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end BattCapSurrogate;

  model DCDCIdeal
    Modelica.Electrical.Analog.Interfaces.PositivePin InP annotation(Placement(visible = true, transformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin InN annotation(Placement(visible = true, transformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Sensors.CurrentSensor OutputCurrent annotation(Placement(visible = true, transformation(origin = {40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Sources.SignalVoltage signalvoltage1 annotation(Placement(visible = true, transformation(origin = {20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Interfaces.PositivePin OutP annotation(Placement(visible = true, transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin OutN annotation(Placement(visible = true, transformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Sensors.VoltageSensor InputVoltage annotation(Placement(visible = true, transformation(origin = {-80, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Sources.SignalCurrent InputCurrent annotation(Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Blocks.Sources.Constant OutputVoltage(k = 5) annotation(Placement(visible = true, transformation(origin = {-15, 75}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Division division1 annotation(Placement(visible = true, transformation(origin = {40, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Product product1 annotation(Placement(visible = true, transformation(origin = {60, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay fixeddelay1(delayTime = 0.001) annotation(Placement(visible = true, transformation(origin = {80, -40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  equation
    connect(product1.y, fixeddelay1.u) annotation(Line(points = {{65.5, -40}, {73.5001, -40}, {73.5001, -40.2052}, {73.5001, -40.2052}}));
    connect(fixeddelay1.y, InputCurrent.i) annotation(Line(points = {{85.5, -40}, {92.22069999999999, -40}, {92.22069999999999, -51.0104}, {-13.5693, -51.0104}, {-13.5693, 19.6}, {-33, 19.6}, {-33, 20}}));
    connect(OutputVoltage.y, division1.u1) annotation(Line(points = {{-9.5, 75}, {0.251283, 75}, {0.251283, -17.2129}, {33.9231, -17.2129}, {33.9231, -17.2129}}));
    connect(InP, InputCurrent.p) annotation(Line(points = {{-100, 80}, {-40.3308, 80}, {-40.3308, 30.2795}, {-40.8334, 30.2795}, {-40.8334, 30.2795}}));
    connect(OutputCurrent.i, product1.u1) annotation(Line(points = {{40, 50}, {39.6294, 50}, {39.6294, 1.2352}, {50.5404, 1.2352}, {50.5404, -37.0561}, {53.4225, -37.0561}, {53.4225, -37.0561}}));
    connect(division1.y, product1.u2) annotation(Line(points = {{45.5, -20}, {47.0407, -20}, {47.0407, -42.8204}, {53.4225, -42.8204}, {53.4225, -42.8204}}));
    connect(InputVoltage.v, division1.u2) annotation(Line(points = {{-90, 20}, {-90, -23.4689}, {33.8652, -23.4689}, {33.8652, -23.4689}}));
    connect(OutputVoltage.y, signalvoltage1.v) annotation(Line(points = {{-9.5, 75}, {0.514668, 75}, {0.514668, 38.2913}, {33.2476, 38.2913}, {33.2476, 19.1457}, {27, 19.1457}, {27, 20}}));
    connect(InputVoltage.n, InN) annotation(Line(points = {{-80, 10}, {-80, -79.67059999999999}, {-98.30159999999999, -79.67059999999999}, {-98.30159999999999, -79.67059999999999}}));
    connect(InP, InputVoltage.p) annotation(Line(points = {{-100, 80}, {-80.1853, 80}, {-80.1853, 30.8801}, {-80.1853, 30.8801}}));
    connect(OutputCurrent.n, OutP) annotation(Line(points = {{50, 60}, {76.47969999999999, 60}, {76.47969999999999, 79.46469999999999}, {100.154, 79.46469999999999}, {100.154, 79.46469999999999}}));
    connect(OutN, signalvoltage1.n) annotation(Line(points = {{100, -80}, {20.0721, -80}, {20.0721, 9.469889999999999}, {20.0721, 9.469889999999999}}));
    connect(signalvoltage1.p, OutputCurrent.p) annotation(Line(points = {{20, 30}, {20, 59.7015}, {30.1595, 59.7015}, {30.1595, 59.7015}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Line(origin = {164.507, 114.722}, points = {{-236.221, 0.594054}, {-53.6171, 0.594054}})}));
  end DCDCIdeal;

  model TbLoad
    Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 4) annotation(Placement(visible = true, transformation(origin = {20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {-60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(pin_p, resistor1.p) annotation(Line(points = {{-60, 40}, {-60.9407, 40}, {-60.9407, 46.2168}, {19.2229, 46.2168}, {19.2229, 29.8569}, {20, 29.8569}, {20, 30}}));
    connect(pin_n, resistor1.n) annotation(Line(points = {{-60, 0}, {20.1661, 0}, {20.1661, 9.80552}, {20.1661, 9.80552}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end TbLoad;

  model SysCtrl
    parameter Real ixx, iyy, izz;
    Modelica.Mechanics.Rotational.Sources.Torque torque1(useSupport = false) annotation(Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 1) annotation(Placement(visible = true, transformation(origin = {40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Sensors.AngleSensor anglesensor1 annotation(Placement(visible = true, transformation(origin = {80, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID PID(yMax = 100, k = 20, wp = 10, Ti = 5, Td = 10, wd = 1, Ni = 4, Nd = 50) annotation(Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Components.SpringDamper springdamper1(c = 0.1, d = 1) annotation(Placement(visible = true, transformation(origin = {20, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput torque annotation(Placement(visible = true, transformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Trapezoid trapezoid1(amplitude = 90, rising = 50, width = 500, falling = 50, period = 3000) annotation(Placement(visible = true, transformation(origin = {-80, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Cos cos1 annotation(Placement(visible = true, transformation(origin = {20, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Abs abs1 annotation(Placement(visible = true, transformation(origin = {60, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    output Modelica.Blocks.Interfaces.RealOutput solarOut annotation(Placement(visible = true, transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(anglesensor1.phi, cos1.u) annotation(Line(points = {{91, -40}, {93.8227, -40}, {93.8227, -4.47628}, {2.86482, -4.47628}, {2.86482, 59.803}, {6.80394, 59.803}, {6.80394, 59.803}}));
    connect(cos1.y, abs1.u) annotation(Line(points = {{31, 60}, {47.4485, 60}, {47.4485, 59.9821}, {47.4485, 59.9821}}));
    connect(abs1.y, solarOut) annotation(Line(points = {{71, 60}, {78.7825, 60}, {78.7825, 80.9311}, {92.0322, 80.9311}, {92.0322, 80.9311}}));
    connect(trapezoid1.y, PID.u_s) annotation(Line(points = {{-69, 60}, {-61.9517, 60}, {-61.9517, 19.8747}, {-53.8944, 19.8747}, {-53.8944, 19.8747}}));
    connect(PID.y, torque) annotation(Line(points = {{-29, 20}, {91.49509999999999, 20}, {91.49509999999999, 22.2023}, {91.49509999999999, 22.2023}}));
    connect(springdamper1.flange_b, inertia1.flange_a) annotation(Line(points = {{30, -80}, {36.7055, -80}, {36.7055, -52.1038}, {24.53, -52.1038}, {24.53, -40.8236}, {29.9015, -40.8236}, {29.9015, -40.8236}}));
    connect(torque1.flange, springdamper1.flange_a) annotation(Line(points = {{10, -40}, {18.2632, -40}, {18.2632, -65.1746}, {2.14861, -65.1746}, {2.14861, -79.6777}, {9.310650000000001, -79.6777}, {9.310650000000001, -79.6777}}));
    connect(PID.y, torque1.tau) annotation(Line(points = {{-29, 20}, {-7.28638, 20}, {-7.28638, -19.4911}, {-25.5023, -19.4911}, {-25.5023, -39.8929}, {-12.2047, -39.8929}, {-12.2047, -39.8929}}));
    connect(anglesensor1.phi, PID.u_m) annotation(Line(points = {{91, -40}, {92.53700000000001, -40}, {92.53700000000001, -6.55774}, {-40.9859, -6.55774}, {-40.9859, 8.01502}, {-40.9859, 8.01502}}));
    connect(inertia1.flange_b, anglesensor1.flange) annotation(Line(points = {{50, -40}, {70.1314, -40}, {70.1314, -40.6216}, {70.1314, -40.6216}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end SysCtrl;

  model Test2
    Modelica.Blocks.Sources.Trapezoid trapezoid1(amplitude = 1.57, rising = 50, width = 500, falling = 50, period = 3600, startTime = 50) annotation(Placement(visible = true, transformation(origin = {-80, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TbLib.Solar_Panels_3 solar_panels_31(currentFactor = 100) annotation(Placement(visible = true, transformation(origin = {-2.5, 80}, extent = {{-15, -12}, {10, 12}}, rotation = 0)));
    TbLib.BattCapSurrogate battcapsurrogate1(CEquivalent = 100) annotation(Placement(visible = true, transformation(origin = {60, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TbLib.Gyroscope_Momentum_Control gyroscope_momentum_control1 annotation(Placement(visible = true, transformation(origin = {20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TbLib.FullCtrl fullctrl2(ixx = 100, torqueGain = 0.5, iyy = 1, izz = 1, pI = 1, pP = 0.5, pD = 1) annotation(Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  equation
    connect(trapezoid1.y, fullctrl2.targetAngle) annotation(Line(points = {{-69, 60}, {-64.7963, 60}, {-64.7963, 42.2001}, {-50, 41}, {-45, 41}}));
    connect(fullctrl2.solarOut, solar_panels_31.u) annotation(Line(points = {{-35, 44}, {-32.7077, 44}, {-32.7077, 85.74160000000001}, {-12.5, 85.74160000000001}, {-12.5, 86}}));
    connect(fullctrl2.torque, gyroscope_momentum_control1.torqueReq) annotation(Line(points = {{-35, 41}, {8.976559999999999, 41}, {8.976559999999999, 20}, {10, 20}}));
    connect(fullctrl2.pin_p, solar_panels_31.pin_p) annotation(Line(points = {{-45, 44}, {-39.7239, 44}, {-39.7239, 95.6468}, {7.73841, 95.6468}, {7.73841, 89.97190000000001}, {7.73841, 89.97190000000001}}));
    connect(fullctrl2.pin_n, gyroscope_momentum_control1.pin_n) annotation(Line(points = {{-45, 36}, {-40.8588, 36}, {-40.8588, 3.30172}, {12.2783, 3.30172}, {12.2783, 20.2231}, {12.2783, 20.2231}}));
    connect(battcapsurrogate1.pin_n, gyroscope_momentum_control1.pin_n) annotation(Line(points = {{50, 52}, {48.5972, 52}, {48.5972, 20.0167}, {12.7942, 20.0167}, {12.7942, 20.0167}}));
    connect(battcapsurrogate1.pin_p, gyroscope_momentum_control1.pin_p) annotation(Line(points = {{52, 68}, {39.7239, 68}, {39.7239, 24.0407}, {12.0719, 24.0407}, {12.0719, 24.0407}}));
    connect(solar_panels_31.pin_n, battcapsurrogate1.pin_n) annotation(Line(points = {{7.5, 74}, {31.5727, 74}, {31.5727, 51.7958}, {49.5258, 51.7958}, {49.5258, 51.7958}}));
    connect(solar_panels_31.pin_p, battcapsurrogate1.pin_p) annotation(Line(points = {{7.5, 90}, {39.7239, 90}, {39.7239, 67.8917}, {51.0735, 67.8917}, {51.0735, 67.8917}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end Test2;

  model FullCtrl
    //model SysCtrl
    parameter Real ixx = 1, iyy, izz, torqueGain, pI, pP, pD;
    Modelica.Mechanics.Rotational.Sources.Torque torque1(useSupport = false) annotation(Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = ixx) annotation(Placement(visible = true, transformation(origin = {40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Sensors.AngleSensor anglesensor1 annotation(Placement(visible = true, transformation(origin = {80, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID PID(yMax = 100, k = 20, wp = pP, Ti = 5, Td = 10, wd = pD, Ni = 4, Nd = 50) annotation(Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Components.SpringDamper springdamper1(c = 0.1, d = 1) annotation(Placement(visible = true, transformation(origin = {20, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput torque annotation(Placement(visible = true, transformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Cos cos1 annotation(Placement(visible = true, transformation(origin = {20, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Abs abs1 annotation(Placement(visible = true, transformation(origin = {60, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    output Modelica.Blocks.Interfaces.RealOutput solarOut annotation(Placement(visible = true, transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    input Modelica.Blocks.Interfaces.RealInput targetAngle annotation(Placement(visible = true, transformation(origin = {-100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 50) annotation(Placement(visible = true, transformation(origin = {-80, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    output Modelica.Blocks.Interfaces.RealOutput angle "current angle of spacecraft" annotation(Placement(visible = true, transformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain1(k = torqueGain) annotation(Placement(visible = true, transformation(origin = {-40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(gain1.y, torque1.tau) annotation(Line(points = {{-29, -40}, {-13.0903, -40}, {-13.0903, -39.4366}, {-13.0903, -39.4366}}));
    connect(PID.y, gain1.u) annotation(Line(points = {{-29, 20}, {-18.3927, 20}, {-18.3927, -16.57}, {-57.6636, -16.57}, {-57.6636, -39.768}, {-52.8583, -39.768}, {-52.8583, -39.768}}));
    connect(anglesensor1.phi, angle) annotation(Line(points = {{91, -40}, {96.3211, -40}, {96.3211, -63.3779}, {79.9331, -63.3779}, {79.9331, -79.9331}, {90.4682, -79.9331}, {90.4682, -79.9331}}));
    connect(resistor1.n, pin_n) annotation(Line(points = {{-80, -30}, {-80, -79.4813}, {-98.55070000000001, -79.4813}, {-98.55070000000001, -79.4813}}));
    connect(pin_p, resistor1.p) annotation(Line(points = {{-100, 80}, {-80.2441, 80}, {-80.2441, -10.2212}, {-80.2441, -10.2212}}));
    connect(targetAngle, PID.u_s) annotation(Line(points = {{-100, 20}, {-53.0378, 20}, {-53.0378, 19.0476}, {-53.0378, 19.0476}}));
    connect(anglesensor1.phi, cos1.u) annotation(Line(points = {{91, -40}, {93.8227, -40}, {93.8227, -4.47628}, {2.86482, -4.47628}, {2.86482, 59.803}, {6.80394, 59.803}, {6.80394, 59.803}}));
    connect(cos1.y, abs1.u) annotation(Line(points = {{31, 60}, {47.4485, 60}, {47.4485, 59.9821}, {47.4485, 59.9821}}));
    connect(abs1.y, solarOut) annotation(Line(points = {{71, 60}, {78.7825, 60}, {78.7825, 80.9311}, {92.0322, 80.9311}, {92.0322, 80.9311}}));
    connect(PID.y, torque) annotation(Line(points = {{-29, 20}, {91.49509999999999, 20}, {91.49509999999999, 22.2023}, {91.49509999999999, 22.2023}}));
    connect(springdamper1.flange_b, inertia1.flange_a) annotation(Line(points = {{30, -80}, {36.7055, -80}, {36.7055, -52.1038}, {24.53, -52.1038}, {24.53, -40.8236}, {29.9015, -40.8236}, {29.9015, -40.8236}}));
    connect(torque1.flange, springdamper1.flange_a) annotation(Line(points = {{10, -40}, {18.2632, -40}, {18.2632, -65.1746}, {2.14861, -65.1746}, {2.14861, -79.6777}, {9.310650000000001, -79.6777}, {9.310650000000001, -79.6777}}));
    connect(anglesensor1.phi, PID.u_m) annotation(Line(points = {{91, -40}, {92.53700000000001, -40}, {92.53700000000001, -6.55774}, {-40.9859, -6.55774}, {-40.9859, 8.01502}, {-40.9859, 8.01502}}));
    connect(inertia1.flange_b, anglesensor1.flange) annotation(Line(points = {{50, -40}, {70.1314, -40}, {70.1314, -40.6216}, {70.1314, -40.6216}}));
    //end SysCtrl;
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end FullCtrl;

  model Partial
    TbLib.SysCtrl sysctrl1(ixx = 10, iyy = 10, izz = 10) annotation(Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Trapezoid trapezoid1(amplitude = 90, rising = 50, width = 500, falling = 50, period = 3000) annotation(Placement(visible = true, transformation(origin = {-80, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(trapezoid1.y, sysctrl1.attitude) annotation(Line(points = {{-69, 40}, {-55.6849, 40}, {-55.6849, 42.256}, {-50.6714, 42.256}, {-50.6714, 42.256}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end Partial;

  model scenario
    Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Trapezoid trapezoid1(rising = 50, width = 500, falling = 60, period = 2000, amplitude = 1.57, startTime = 80) annotation(Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(trapezoid1.y, y) annotation(Line(points = {{-29, 40}, {9.107469999999999, 40}, {9.107469999999999, 40.0729}, {40, 40.0729}, {40, 40}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Line(origin = {-16.7577, -2.73226}, points = {{-73.224, 98.1785}, {-189.8, 99.2714}, {-189.8, -82.8779}, {-63.0237, -83.2422}, {-62.2951, 98.9071}, {-83.42440000000001, 98.5428}})}));
  end scenario;
equation
  connect(tbload1.pin_n, src1.pin_n) annotation(Line(points = {{14, 40}, {-14.6172, 40}, {-14.6172, 38.3207}, {-20, 38.3207}, {-20, 38}}));
  connect(src1.pin_p, tbload1.pin_p) annotation(Line(points = {{-20, 44}, {12.5807, 44}, {12.5807, 41.4422}, {14, 41.4422}, {14, 42}}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), uses(Modelica(version = "3.2.1")));
end TbLib;