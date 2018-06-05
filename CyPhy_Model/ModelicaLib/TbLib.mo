package TbLib
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
    Modelica.Electrical.Analog.Basic.Resistor resistor2(R = 100) annotation(Placement(visible = true, transformation(origin = {80, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Resistor resistor1 annotation(Placement(visible = true, transformation(origin = {82, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
    TbLib.BatteryV2 batteryv21 annotation(Placement(visible = true, transformation(origin = {-66, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TbLib.Body body1(ixx = 1) annotation(Placement(visible = true, transformation(origin = {-20, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TbLib.Shelf shelf1 annotation(Placement(visible = true, transformation(origin = {-54, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TbLib.Cargo cargo1 annotation(Placement(visible = true, transformation(origin = {16, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TbLib.Shelf shelf2 annotation(Placement(visible = true, transformation(origin = {-52, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TbLib.Computer computer1(k = 10, p = 10, d = 0.1) annotation(Placement(visible = true, transformation(origin = {-82, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TbLib.PVPanel pvpanel1 annotation(Placement(visible = true, transformation(origin = {56, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TbLib.Shelf shelf3 annotation(Placement(visible = true, transformation(origin = {-114, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TbLib.Gyroscope gyroscope1(torquegain = 1, powergain = 1) annotation(Placement(visible = true, transformation(origin = {-152, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TbLib.STKscenario stkscenario1 annotation(Placement(visible = true, transformation(origin = {-60, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(stkscenario1.y, computer1.setpoint) annotation(Line(points = {{-50, -58}, {-39.3046, -58}, {-39.3046, -36.4324}, {-96.4475, -36.4324}, {-96.4475, -13.4543}, {-91.7611, -13.4543}, {-91.7611, -13.4543}}, color = {0, 0, 127}));
    connect(computer1.torqueReq, gyroscope1.torqueReq) annotation(Line(points = {{-72, -14}, {-68, -14}, {-68, -28}, {-172, -28}, {-172, 22}, {-161, 22}}, color = {0, 0, 127}));
    connect(gyroscope1.angle, computer1.angleMeas) annotation(Line(points = {{-143, 22}, {-134, 22}, {-134, -20}, {-91, -20}}, color = {0, 0, 127}));
    connect(gyroscope1.flange_b, shelf3.flange_a) annotation(Line(points = {{-143, 19}, {-132, 19}, {-132, 21}, {-123, 21}}));
    connect(gyroscope1.pin_n, shelf3.pin_n) annotation(Line(points = {{-143, 14}, {-134, 14}, {-134, 12}, {-123, 12}}, color = {0, 0, 255}));
    connect(gyroscope1.pin_p, shelf3.pin_p) annotation(Line(points = {{-143, 30}, {-132, 30}, {-132, 28}, {-124, 28}}, color = {0, 0, 255}));
    connect(shelf3.pin_p, shelf1.pin_p) annotation(Line(points = {{-124, 28}, {-124, 28}, {-124, 34}, {-70, 34}, {-70, 20}, {-64, 20}, {-64, 20}, {-64, 20}}, color = {0, 0, 255}));
    connect(shelf3.pin_n, shelf1.pin_n) annotation(Line(points = {{-123, 12}, {-122, 12}, {-122, 4}, {-63, 4}}, color = {0, 0, 255}));
    connect(shelf3.flange_b, body1.flange_a) annotation(Line(points = {{-105, 21}, {-96, 21}, {-96, 28}, {-34, 28}, {-34, 13}, {-29, 13}}));
    connect(pvpanel1.pin_n, batteryv21.pin_n) annotation(Line(points = {{64, 30}, {78, 30}, {78, 60}, {-36, 60}, {-36, 34}, {-76, 34}, {-76, 40}, {-74, 40}, {-74, 40}}, color = {0, 0, 255}));
    connect(pvpanel1.pin_p, batteryv21.pin_p) annotation(Line(points = {{65, 48}, {66, 48}, {66, 72}, {-80, 72}, {-80, 54}, {-74, 54}, {-74, 54}}, color = {0, 0, 255}));
    connect(cargo1.flange_b, pvpanel1.flange_a) annotation(Line(points = {{25, 13}, {32, 13}, {32, 40}, {48, 40}, {48, 40}}));
    connect(shelf2.pin_n, body1.pin_n) annotation(Line(points = {{-61, -24}, {-62, -24}, {-62, -28}, {-30, -28}, {-30, 2}, {-30, 2}}, color = {0, 0, 255}));
    connect(computer1.pin_n, shelf2.pin_n) annotation(Line(points = {{-73, -25}, {-62, -25}, {-62, -24}, {-62, -24}, {-62, -24}}, color = {0, 0, 255}));
    connect(batteryv21.pin_n, shelf1.pin_n) annotation(Line(points = {{-75, 41}, {-76, 41}, {-76, 4}, {-62, 4}, {-62, 4}}, color = {0, 0, 255}));
    connect(body1.pin_n, cargo1.pin_n) annotation(Line(points = {{-29, 4}, {-30, 4}, {-30, -2}, {4, -2}, {4, 4}, {6, 4}, {6, 4}}, color = {0, 0, 255}));
    connect(shelf1.pin_n, body1.pin_n) annotation(Line(points = {{-63, 4}, {-64, 4}, {-64, -2}, {-30, -2}, {-30, 4}, {-30, 4}}, color = {0, 0, 255}));
    connect(shelf2.pin_p, shelf1.pin_p) annotation(Line(points = {{-62, -8}, {-62, -8}, {-62, -2}, {-80, -2}, {-80, 20}, {-64, 20}, {-64, 20}}, color = {0, 0, 255}));
    connect(shelf2.pin_p, computer1.pin_p) annotation(Line(points = {{-62, -8}, {-72, -8}, {-72, -8}, {-72, -8}}, color = {0, 0, 255}));
    connect(shelf1.pin_p, batteryv21.pin_p) annotation(Line(points = {{-64, 20}, {-88, 20}, {-88, 56}, {-74, 56}, {-74, 56}}, color = {0, 0, 255}));
    connect(body1.pin_p, shelf1.pin_p) annotation(Line(points = {{-30, 20}, {-30, 20}, {-30, 26}, {-66, 26}, {-66, 20}, {-64, 20}, {-64, 20}}, color = {0, 0, 255}));
    connect(cargo1.pin_p, body1.pin_p) annotation(Line(points = {{6, 20}, {6, 20}, {6, 26}, {-30, 26}, {-30, 20}, {-30, 20}}, color = {0, 0, 255}));
    connect(shelf2.flange_b, body1.flange_a) annotation(Line(points = {{-43, -15}, {-36, -15}, {-36, 14}, {-30, 14}, {-30, 12}, {-30, 12}}));
    connect(computer1.flange_b, shelf2.flange_a) annotation(Line(points = {{-73, -10}, {-66, -10}, {-66, -16}, {-60, -16}, {-60, -16}}));
    connect(body1.flange_b, cargo1.flange_a) annotation(Line(points = {{-11, 15}, {2, 15}, {2, 12}, {6, 12}, {6, 12}}));
    connect(shelf1.flange_b, body1.flange_a) annotation(Line(points = {{-45, 13}, {-30, 13}, {-30, 12}, {-30, 12}}));
    connect(batteryv21.flange_b, shelf1.flange_a) annotation(Line(points = {{-57, 49}, {-50, 49}, {-50, 30}, {-74, 30}, {-74, 13}, {-63, 13}}));
    annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
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
    Modelica.Electrical.Analog.Sources.SignalCurrent signalcurrent2 annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 90)));
    Modelica.Electrical.Analog.Semiconductors.Diode diode2(Vt = 0.18) annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
    Modelica.Electrical.Analog.Basic.Resistor resistor2(R = 0.01) annotation(Placement(visible = true, transformation(origin = {0, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
    Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 0.01) annotation(Placement(visible = true, transformation(origin = {40, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Electrical.Analog.Sensors.CurrentSensor currentsensor1 annotation(Placement(visible = true, transformation(origin = {60, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {94, 108}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Sensors.VoltageSensor voltagesensor1 annotation(Placement(visible = true, transformation(origin = {40, -24}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {86, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain1(k = currentFactor) annotation(Placement(visible = true, transformation(origin = {-34, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Abs abs1 annotation(Placement(visible = true, transformation(origin = {-58, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Cos cos1 annotation(Placement(visible = true, transformation(origin = {-90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput v annotation(Placement(visible = true, transformation(origin = {94, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput i annotation(Placement(visible = true, transformation(origin = {96, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-142, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(cos1.u, u) annotation(Line(points = {{-102, 60}, {-142, 60}}, color = {0, 0, 127}));
    connect(currentsensor1.i, i) annotation(Line(points = {{70, 100}, {70, 96.0814}, {85.0891, 96.0814}, {85.0891, 60}, {96, 60}}));
    connect(voltagesensor1.v, v) annotation(Line(points = {{50, -24}, {50, -39.4911}, {74.9109, -39.4911}, {74.9109, -38}, {94, -38}}));
    connect(cos1.y, abs1.u) annotation(Line(points = {{-79, 60}, {-70, 60}}, color = {0, 0, 127}));
    connect(abs1.y, gain1.u) annotation(Line(points = {{-47, 60}, {-40, 60}}, color = {0, 0, 127}));
    connect(gain1.y, signalcurrent1.i) annotation(Line(points = {{-28.5, 60}, {-6.07062, 60}, {-6.07062, 60.5165}}));
    connect(gain1.y, signalcurrent2.i) annotation(Line(points = {{-28.5, 60}, {-20.7455, 60}, {-20.7455, -0.259319}, {-5.70502, -0.259319}}));
    connect(signalcurrent2.p, pin_n) annotation(Line(points = {{-4.59227e-16, -7.5}, {-4.59227e-16, -58}, {86, -58}}));
    connect(voltagesensor1.n, pin_n) annotation(Line(points = {{40, -34}, {40, -58}, {86, -58}}));
    connect(pin_p, voltagesensor1.p) annotation(Line(points = {{94, 108}, {79.3893, 108}, {79.3893, -14}, {40, -14}}));
    connect(pin_p, currentsensor1.n) annotation(Line(points = {{94, 108}, {60.2545, 108}, {60.2545, 109.924}}));
    connect(currentsensor1.p, resistor1.n) annotation(Line(points = {{60, 90}, {60, 80.20359999999999}, {44.7837, 80.20359999999999}, {44.7837, 80.20359999999999}}));
    connect(signalcurrent1.n, resistor1.p) annotation(Line(points = {{4.59227e-016, 67.5}, {4.59227e-016, 79.2975}, {34.5267, 79.2975}, {35, 80.4357}, {35, 80}}));
    connect(diode1.p, resistor1.p) annotation(Line(points = {{20, 65}, {20, 79.35639999999999}, {35.3465, 80}, {35, 80}}));
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
    parameter Real cap;
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = cap, v(start = 10)) annotation(Placement(visible = true, transformation(origin = {-44, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 0.001) annotation(Placement(visible = true, transformation(origin = {-8, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(capacitor1.n, resistor1.p) annotation(Line(points = {{-34, 62}, {-18, 62}}, color = {0, 0, 255}));
    connect(resistor1.n, pin_n) annotation(Line(points = {{2, 62}, {18, 62}, {18, -78}, {-100, -78}}, color = {0, 0, 255}));
    connect(pin_p, capacitor1.p) annotation(Line(points = {{-100, 80}, {-78, 80}, {-78, 62}, {-54, 62}}, color = {0, 0, 255}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end BattSurrogate;

  model BattCapSurrogate
    parameter Real CEquivalent = 100;
    Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 0.05) annotation(Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = CEquivalent) annotation(Placement(visible = true, transformation(origin = {-60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Sensors.CurrentSensor currentsensor1 annotation(Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Sensors.VoltageSensor voltagesensor1 annotation(Placement(visible = true, transformation(origin = {40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput i annotation(Placement(visible = true, transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput v annotation(Placement(visible = true, transformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
    Modelica.Blocks.Sources.Pulse pulse1(amplitude = 1, period = 20, width = 50, offset = -0.5) annotation(Placement(visible = true, transformation(origin = {-92, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TbLib.Shelf shelf2 annotation(Placement(visible = true, transformation(origin = {20, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TbLib.BatteryV2 batteryv21 annotation(Placement(visible = true, transformation(origin = {-16, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TbLib.Shelf shelf1 annotation(Placement(visible = true, transformation(origin = {22, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TbLib.Gyroscope gyroscope1(torquegain = 500, powergain = 3, gyrosize = 3) annotation(Placement(visible = true, transformation(origin = {-28, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TbLib.Computer computer1(k = 1, p = 1, d = 1) annotation(Placement(visible = true, transformation(origin = {-50, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TbLib.Body body1(ixx = 10) annotation(Placement(visible = true, transformation(origin = {60, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TbLib.PVPanel pvpanel1 annotation(Placement(visible = true, transformation(origin = {52, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(pvpanel1.pin_n, body1.pin_n) annotation(Line(points = {{60, 60}, {64, 60}, {64, 56}, {42, 56}, {42, 20}, {50, 20}, {50, 20}}, color = {0, 0, 255}));
    connect(pvpanel1.pin_p, body1.pin_p) annotation(Line(points = {{61, 78}, {68, 78}, {68, 52}, {46, 52}, {46, 36}, {50, 36}, {50, 36}}, color = {0, 0, 255}));
    connect(pvpanel1.flange_a, body1.flange_b) annotation(Line(points = {{43, 70}, {36, 70}, {36, 84}, {74, 84}, {74, 30}, {70, 30}, {70, 30}}));
    connect(body1.Heat_b, shelf1.Heat_b) annotation(Line(points = {{69, 24}, {48.2, 24}, {48.2, 14.4}, {36.2, 14.4}, {36.2, 24.4}, {30.2, 24.4}, {30.2, 26.4}}, color = {191, 0, 0}));
    connect(body1.Heat_b, shelf2.Heat_b) annotation(Line(points = {{69, 24}, {72.2, 24}, {72.2, -11.6}, {30.2, -11.6}}, color = {191, 0, 0}));
    connect(shelf2.flange_b, body1.flange_a) annotation(Line(points = {{29.2, -7.4}, {40.2, -7.4}, {40.2, 25.6}, {51, 25.6}, {51, 29}}));
    connect(body1.pin_n, shelf2.pin_n) annotation(Line(points = {{51, 20}, {45.6, 20}, {45.6, -26.2}, {7.6, -26.2}, {7.6, -16.2}, {11.6, -16.2}}, color = {0, 0, 255}));
    connect(body1.pin_p, shelf2.pin_p) annotation(Line(points = {{50, 36}, {50, 42.2}, {84.4, 42.2}, {84.4, 6.2}, {8.4, 6.2}, {8.4, 0.2}, {10.4, 0.2}}, color = {0, 0, 255}));
    connect(shelf1.pin_p, body1.pin_p) annotation(Line(points = {{12.4, 36.2}, {12.4, 38.2}, {50, 38.2}, {50, 36}}, color = {0, 0, 255}));
    connect(shelf1.pin_n, body1.pin_n) annotation(Line(points = {{12.6, 19.8}, {11.6, 19.8}, {11.6, 11.8}, {41.6, 11.8}, {41.6, 20}, {51, 20}}, color = {0, 0, 255}));
    connect(shelf1.flange_b, body1.flange_a) annotation(Line(points = {{31.2, 28.6}, {42.2, 28.6}, {42.2, 29}, {51, 29}}));
    connect(gyroscope1.angle, computer1.angleMeas) annotation(Line(points = {{-37, 35}, {-66, 35}, {-66, 52}, {-60, 52}, {-60, 52}, {-60, 52}}, color = {0, 0, 127}));
    connect(computer1.pin_n, gyroscope1.pin_n) annotation(Line(points = {{-41, 47}, {-6, 47}, {-6, 20}, {-19, 20}}, color = {0, 0, 255}));
    connect(computer1.pin_p, gyroscope1.pin_p) annotation(Line(points = {{-41, 65}, {-12, 65}, {-12, 36}, {-19, 36}}, color = {0, 0, 255}));
    connect(computer1.torqueReq, gyroscope1.torqueReq) annotation(Line(points = {{-40, 58}, {-40, 40}, {-46, 40}, {-46, 28}, {-37, 28}}, color = {0, 0, 127}));
    connect(pulse1.y, computer1.setpoint) annotation(Line(points = {{-81, 68}, {-72, 68}, {-72, 58}, {-60, 58}}, color = {0, 0, 127}));
    connect(gyroscope1.Heat_a, shelf1.Heat_a) annotation(Line(points = {{-37, 19}, {-42.4, 19}, {-42.4, 14.4}, {7.6, 14.4}, {7.6, 25.4}, {11.6, 25.4}}, color = {191, 0, 0}));
    connect(gyroscope1.pin_p, shelf1.pin_p) annotation(Line(points = {{-19, 36}, {12.2, 36}}, color = {0, 0, 255}));
    connect(shelf1.pin_n, gyroscope1.pin_n) annotation(Line(points = {{12.6, 19.8}, {-2.4, 19.8}, {-2.4, 20}, {-19, 20}}, color = {0, 0, 255}));
    connect(gyroscope1.flange_b, shelf1.flange_a) annotation(Line(points = {{-19, 25}, {0, 25}, {0, 28.8}, {13, 28.8}}));
    connect(shelf2.pin_p, batteryv21.pin_p) annotation(Line(points = {{10.4, 0.2}, {7.4, 0.2}, {7.4, 0.2}, {6.4, 0.2}, {6.4, 6.2}, {-29.6, 6.2}, {-29.6, 0.2}, {-23.6, 0.2}, {-23.6, 0.2}, {-23.6, 0.2}, {-23.6, 0.2}, {-23.6, 0.2}}, color = {0, 0, 255}));
    connect(batteryv21.Heat_a, shelf2.Heat_a) annotation(Line(points = {{-25.8, -8.6}, {-33.8, -8.6}, {-33.8, -27.6}, {0.2, -27.6}, {0.2, -11.6}, {10.2, -11.6}, {10.2, -11.6}, {10.2, -11.6}, {10.2, -11.6}}, color = {191, 0, 0}));
    connect(batteryv21.flange_b, shelf2.flange_a) annotation(Line(points = {{-6.6, -7.4}, {-0.1, -7.4}, {-0.1, -7.4}, {6.4, -7.4}, {6.4, -8.4}, {12.4, -8.4}, {12.4, -8.4}, {12.4, -8.4}, {12.4, -8.4}}));
    connect(batteryv21.pin_n, shelf2.pin_n) annotation(Line(points = {{-25, -15.2}, {-25.5, -15.2}, {-25.5, -15.2}, {-26, -15.2}, {-26, -22.2}, {10, -22.2}, {10, -16.2}, {10, -16.2}, {10, -16.2}, {10, -16.2}}, color = {0, 0, 255}));
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
    parameter Real commTime, per, tstart;
    Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {32, -2}, extent = {{-8, -8}, {8, 8}}, rotation = 0), iconTransformation(origin = {40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Trapezoid trapezoid1(rising = 10, width = commTime, falling = 10, period = per, amplitude = 1.57, startTime = tstart) annotation(Placement(visible = true, transformation(origin = {-11, -3}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  equation
    connect(trapezoid1.y, y) annotation(Line(points = {{-3, -3}, {11.1075, -3}, {11.1075, -1.9271}, {32, -1.9271}, {32, -2}}));
    annotation(Diagram(coordinateSystem(extent = {{-30, -30}, {30, 30}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-30, -30}, {30, 30}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end scenario;

  model STKscenario
    parameter Real commTime, per, tstart;
    Modelica.Blocks.Sources.CombiTimeTable combitimetable1(tableOnFile = true, tableName = "tab1", fileName = "D:/Work/Modelica/tab.txt") annotation(Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(combitimetable1.y[1], y) annotation(Line(points = {{-29, 20}, {91.3676, 20}, {91.3676, 21.7265}, {91.3676, 21.7265}}, color = {0, 0, 127}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end STKscenario;

  model ConnPoints
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end ConnPoints;

  model Computer
    parameter Real k, p, d;
    Modelica.Blocks.Continuous.LimPID PID(yMax = 100, k = k, wp = p, Ti = 1, Td = 1, wd = d, Ni = 4, Nd = 50) annotation(Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput torqueReq annotation(Placement(visible = true, transformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    input Modelica.Blocks.Interfaces.RealInput setpoint annotation(Placement(visible = true, transformation(origin = {-100, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-96, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    input Modelica.Blocks.Interfaces.RealInput angleMeas annotation(Placement(visible = true, transformation(origin = {-94, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 30) annotation(Placement(visible = true, transformation(origin = {42, -18}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {94, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {94, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {92, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {92, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(Placement(visible = true, transformation(origin = {94, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {94, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 0.01) annotation(Placement(visible = true, transformation(origin = {64, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(flange_b, inertia1.flange_b) annotation(Line(points = {{94, 56}, {74, 56}, {74, 56}, {74, 56}}));
    connect(resistor1.p, pin_p) annotation(Line(points = {{42, -8}, {46, -8}, {46, 86}, {94, 86}, {94, 86}}, color = {0, 0, 255}));
    connect(resistor1.n, pin_n) annotation(Line(points = {{42, -28}, {44, -28}, {44, -86}, {90, -86}, {90, -86}}, color = {0, 0, 255}));
    connect(PID.u_m, angleMeas) annotation(Line(points = {{-40, 8}, {-40, 8}, {-40, -36}, {-90, -36}, {-90, -36}}, color = {0, 0, 127}));
    connect(PID.u_s, setpoint) annotation(Line(points = {{-52, 20}, {-68, 20}, {-68, 44}, {-92, 44}, {-92, 44}}, color = {0, 0, 127}));
    connect(PID.y, torqueReq) annotation(Line(points = {{-29, 20}, {91.49509999999999, 20}, {91.49509999999999, 22.2023}, {91.49509999999999, 22.2023}}));
  end Computer;

  model RotationalBody
    parameter Real ixx, iyy, izz;
    Modelica.Mechanics.Rotational.Sensors.AngleSensor anglesensor1 annotation(Placement(visible = true, transformation(origin = {9, -1}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatcapacitor1(C = 1) annotation(Placement(visible = true, transformation(origin = {0, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {-46, -46}, extent = {{-6, -6}, {6, 6}}, rotation = 0), iconTransformation(origin = {-42, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a Heat annotation(Placement(visible = true, transformation(origin = {44, 40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Components.ThermalResistor thermalresistor1(R = 0.01) annotation(Placement(visible = true, transformation(origin = {24, 30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    output Modelica.Blocks.Interfaces.RealOutput angle annotation(Placement(visible = true, transformation(origin = {49, -1}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = ixx) annotation(Placement(visible = true, transformation(origin = {-20, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {-45, 43}, extent = {{-7, -7}, {7, 7}}, rotation = 0), iconTransformation(origin = {-44, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(visible = true, transformation(origin = {-46, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-88, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(flange_a, inertia1.flange_a) annotation(Line(points = {{-46, 0}, {-38, 0}, {-38, 8}, {-30, 8}}));
    connect(inertia1.flange_b, anglesensor1.flange) annotation(Line(points = {{-10, 8}, {-11, 8}, {-11, -1}, {0, -1}}));
    connect(anglesensor1.phi, angle) annotation(Line(points = {{19, -1}, {49, -1}}, color = {0, 0, 127}));
    connect(thermalresistor1.port_b, heatcapacitor1.port) annotation(Line(points = {{30, 30}, {15, 30}, {15, 24}, {0, 24}}, color = {191, 0, 0}));
    connect(thermalresistor1.port_a, Heat) annotation(Line(points = {{18, 30}, {32, 30}, {32, 40}, {44, 40}}, color = {191, 0, 0}));
  end RotationalBody;

  model Gyroscope
    parameter Real torquegain, powergain, gyrosize;
    Modelica.Electrical.Analog.Sources.SignalCurrent signalcurrent1 annotation(Placement(visible = true, transformation(origin = {28, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
    Modelica.Blocks.Math.Gain gain1(k = powergain * gyrosize) annotation(Placement(visible = true, transformation(origin = {-19, 3}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain GyroTorqueGain(k = torquegain * gyrosize) "For Sizing of Gyro" annotation(Placement(visible = true, transformation(origin = {-52, -40}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {94, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {92, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Sensors.AngleSensor anglesensor1 annotation(Placement(visible = true, transformation(origin = {56, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Abs abs1 annotation(Placement(visible = true, transformation(origin = {-58, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    input Modelica.Blocks.Interfaces.RealInput torqueReq annotation(Placement(visible = true, transformation(origin = {-98, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-94, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatcapacitor1(C = 1, der_T(start = 0), T(start = 20)) annotation(Placement(visible = true, transformation(origin = {12, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {94, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {88, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(Placement(visible = true, transformation(origin = {94, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Components.ThermalResistor thermalresistor1(R = 0.1) annotation(Placement(visible = true, transformation(origin = {48, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedheatflow1 annotation(Placement(visible = true, transformation(origin = {-24, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain2(k = -500) annotation(Placement(visible = true, transformation(origin = {-54, -82}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a Heat_a annotation(Placement(visible = true, transformation(origin = {-94, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-94, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperaturesensor1 annotation(Placement(visible = true, transformation(origin = {-48, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput temp annotation(Placement(visible = true, transformation(origin = {-88, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {96, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    output Modelica.Blocks.Interfaces.RealOutput current "current consumed" annotation(Placement(visible = true, transformation(origin = {98, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {92, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput angle annotation(Placement(visible = true, transformation(origin = {98, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Sources.Torque torque1(useSupport = false) annotation(Placement(visible = true, transformation(origin = {-16, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Sensors.CurrentSensor currentsensor1 annotation(Placement(visible = true, transformation(origin = {44, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(currentsensor1.p, signalcurrent1.p) annotation(Line(points = {{34, 58}, {24.1037, 58}, {24.1037, 10}, {28, 10}}));
    connect(currentsensor1.n, pin_p) annotation(Line(points = {{54, 58}, {72, 58}, {72, 60}, {94, 60}}, color = {0, 0, 255}));
    connect(currentsensor1.i, current) annotation(Line(points = {{44, 48}, {44, 36}, {88, 36}}, color = {0, 0, 127}));
    connect(gain2.u, currentsensor1.i) annotation(Line(points = {{-64, -82}, {-76, -82}, {-76, 48}, {44, 48}}, color = {0, 0, 127}));
    connect(flange_b, torque1.flange) annotation(Line(points = {{94, -40}, {-6, -40}}));
    connect(GyroTorqueGain.y, torque1.tau) annotation(Line(points = {{-43, -40}, {-28, -40}}, color = {0, 0, 127}));
    connect(anglesensor1.flange, torque1.flange) annotation(Line(points = {{46, -24}, {46, -35}, {-6, -35}, {-6, -40}}));
    connect(heatcapacitor1.port, temperaturesensor1.port) annotation(Line(points = {{12, -82}, {0, -82}, {0, 58}, {-64, 58}, {-64, 68}, {-58, 68}, {-58, 68}}, color = {191, 0, 0}));
    connect(temperaturesensor1.T, temp) annotation(Line(points = {{-38, 68}, {-24, 68}, {-24, 86}, {-94, 86}, {-94, 92}, {-94, 92}}, color = {0, 0, 127}));
    connect(gain2.y, prescribedheatflow1.Q_flow) annotation(Line(points = {{-45, -82}, {-34, -82}}, color = {0, 0, 127}));
    connect(prescribedheatflow1.port, heatcapacitor1.port) annotation(Line(points = {{-14, -82}, {12, -82}}, color = {191, 0, 0}));
    connect(thermalresistor1.port_b, Heat_a) annotation(Line(points = {{58, -82}, {75, -82}, {75, -98}, {-94, -98}}, color = {191, 0, 0}));
    connect(heatcapacitor1.port, thermalresistor1.port_a) annotation(Line(points = {{12, -82}, {38, -82}}, color = {191, 0, 0}));
    connect(signalcurrent1.n, pin_n) annotation(Line(points = {{28, -10}, {28, -64}, {94, -64}}, color = {0, 0, 255}));
    connect(torqueReq, GyroTorqueGain.u) annotation(Line(points = {{-98, 2}, {-82, 2}, {-82, -40}, {-62, -40}, {-62, -40}}, color = {0, 0, 127}));
    connect(torqueReq, abs1.u) annotation(Line(points = {{-98, 2}, {-70, 2}, {-70, 0}, {-70, 0}}, color = {0, 0, 127}));
    connect(abs1.y, gain1.u) annotation(Line(points = {{-47, 2}, {-40.8407, 2}, {-40.8407, -0.164204}, {-41, -0.164204}, {-41, 3.4179}, {-31, 3.4179}, {-31, 3}}));
    connect(anglesensor1.phi, angle) annotation(Line(points = {{67, -24}, {78, -24}, {78, 4}, {92, 4}, {92, 4}}, color = {0, 0, 127}));
    connect(gain1.y, signalcurrent1.i) annotation(Line(points = {{-8, 3}, {21, 3}, {21, 0}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end Gyroscope;

  model PV_Panel
    parameter Real currentFactor;
    Modelica.Electrical.Analog.Sources.SignalCurrent signalcurrent1 annotation(Placement(visible = true, transformation(origin = {0, 60}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 90)));
    Modelica.Electrical.Analog.Semiconductors.Diode diode1(Vt = 0.18) annotation(Placement(visible = true, transformation(origin = {20, 60}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
    Modelica.Electrical.Analog.Sources.SignalCurrent signalcurrent2 annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 90)));
    Modelica.Electrical.Analog.Semiconductors.Diode diode2(Vt = 0.18) annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
    Modelica.Electrical.Analog.Basic.Resistor resistor2(R = 0.01) annotation(Placement(visible = true, transformation(origin = {0, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
    Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 0.01) annotation(Placement(visible = true, transformation(origin = {40, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Electrical.Analog.Sensors.CurrentSensor currentsensor1 annotation(Placement(visible = true, transformation(origin = {60, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {94, 108}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Sensors.VoltageSensor voltagesensor1 annotation(Placement(visible = true, transformation(origin = {40, -24}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
    Modelica.Blocks.Math.Gain gain1(k = currentFactor) annotation(Placement(visible = true, transformation(origin = {-34, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Abs abs1 annotation(Placement(visible = true, transformation(origin = {-58, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Cos cos1 annotation(Placement(visible = true, transformation(origin = {-90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput i annotation(Placement(visible = true, transformation(origin = {96, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput incidentAngle "Angle of sun, radians" annotation(Placement(visible = true, transformation(origin = {-140, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {86, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, -106}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput v annotation(Placement(visible = true, transformation(origin = {94, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(voltagesensor1.v, v) annotation(Line(points = {{50, -24}, {50, -39.4911}, {74.9109, -39.4911}, {74.9109, -26}, {94, -26}}));
    connect(cos1.u, u) annotation(Line(points = {{-102, 60}, {-140, 60}}, color = {0, 0, 127}));
    connect(currentsensor1.i, i) annotation(Line(points = {{70, 100}, {70, 96.0814}, {85.0891, 96.0814}, {85.0891, 60}, {96, 60}}));
    connect(cos1.u, incidentAngle) annotation(Line(points = {{-102, 60}, {-122, 60}}, color = {0, 0, 127}));
    connect(cos1.y, abs1.u) annotation(Line(points = {{-79, 60}, {-70, 60}}, color = {0, 0, 127}));
    connect(abs1.y, gain1.u) annotation(Line(points = {{-47, 60}, {-40, 60}}, color = {0, 0, 127}));
    connect(gain1.y, signalcurrent1.i) annotation(Line(points = {{-28.5, 60}, {-6.07062, 60}, {-6.07062, 60.5165}}));
    connect(gain1.y, signalcurrent2.i) annotation(Line(points = {{-28.5, 60}, {-20.7455, 60}, {-20.7455, -0.259319}, {-5.70502, -0.259319}}));
    connect(signalcurrent2.p, pin_n) annotation(Line(points = {{-4.59227e-16, -7.5}, {-4.59227e-16, -58}, {86, -58}}));
    connect(voltagesensor1.n, pin_n) annotation(Line(points = {{40, -34}, {40, -58}, {86, -58}}));
    connect(pin_p, voltagesensor1.p) annotation(Line(points = {{94, 108}, {79.3893, 108}, {79.3893, -14}, {40, -14}}));
    connect(pin_p, currentsensor1.n) annotation(Line(points = {{94, 108}, {60.2545, 108}, {60.2545, 109.924}}));
    connect(currentsensor1.p, resistor1.n) annotation(Line(points = {{60, 90}, {60, 80.20359999999999}, {44.7837, 80.20359999999999}, {44.7837, 80.20359999999999}}));
    connect(signalcurrent1.n, resistor1.p) annotation(Line(points = {{4.59227e-016, 67.5}, {4.59227e-016, 79.2975}, {34.5267, 79.2975}, {35, 80.4357}, {35, 80}}));
    connect(diode1.p, resistor1.p) annotation(Line(points = {{20, 65}, {20, 79.35639999999999}, {35.3465, 80}, {35, 80}}));
    connect(resistor2.n, signalcurrent1.p) annotation(Line(points = {{3.06152e-016, 25}, {3.06152e-016, 51.2168}, {-0.395497, 51.2168}, {-0.395497, 51.2168}}));
    connect(signalcurrent2.n, resistor2.p) annotation(Line(points = {{4.59227e-016, 7.5}, {4.59227e-016, 14.6334}, {-0.395497, 14.6334}, {-0.395497, 14.6334}}));
    connect(diode2.n, signalcurrent2.p) annotation(Line(points = {{20, -5}, {20, -13.0514}, {0.395497, -13.0514}, {0.395497, -7.31669}, {-0.988741, -7.31669}, {-0.988741, -7.31669}}));
    connect(signalcurrent2.n, diode2.p) annotation(Line(points = {{4.59227e-016, 7.5}, {4.59227e-016, 9.957140000000001}, {18.9808, 9.957140000000001}, {18.9808, 3.73393}, {18.9808, 3.73393}}));
    connect(signalcurrent1.p, diode1.n) annotation(Line(points = {{-4.59227e-016, 52.5}, {-4.59227e-016, 51.1139}, {20.4455, 51.1139}, {20.4455, 55.099}, {20.4455, 55.099}}));
    annotation(Diagram(coordinateSystem(extent = {{-150, -120}, {100, 120}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-150, -120}, {100, 120}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end PV_Panel;

  model SatBody
    parameter Real ixx, iyy, izz;
    Modelica.Mechanics.Rotational.Sensors.AngleSensor anglesensor1 annotation(Placement(visible = true, transformation(origin = {9, -1}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a Heat annotation(Placement(visible = true, transformation(origin = {92, 60}, extent = {{-6, -6}, {6, 6}}, rotation = 0), iconTransformation(extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    output Modelica.Blocks.Interfaces.RealOutput angle annotation(Placement(visible = true, transformation(origin = {99, -1}, extent = {{-9, -9}, {9, 9}}, rotation = 0), iconTransformation(extent = {{-9, -9}, {9, 9}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Components.ThermalResistor thermalresistor1(R = 0.01) annotation(Placement(visible = true, transformation(origin = {38, 60}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatcapacitor1 annotation(Placement(visible = true, transformation(origin = {-8, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = ixx) annotation(Placement(visible = true, transformation(origin = {-22, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(visible = true, transformation(origin = {-94, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-96, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {-92, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {-94, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-94, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(inertia1.flange_a, flange_a) annotation(Line(points = {{-32, 0}, {-94, 0}, {-94, 0}, {-94, 0}}));
    connect(heatcapacitor1.port, thermalresistor1.port_a) annotation(Line(points = {{-8, 60}, {32, 60}, {32, 60}, {32, 60}}, color = {191, 0, 0}));
    connect(inertia1.flange_b, anglesensor1.flange) annotation(Line(points = {{-12, 0}, {-11, 0}, {-11, -1}, {0, -1}}));
    connect(thermalresistor1.port_a, Heat) annotation(Line(points = {{32, 60}, {92, 60}}, color = {191, 0, 0}));
    connect(anglesensor1.phi, angle) annotation(Line(points = {{19, -1}, {99, -1}}, color = {0, 0, 127}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end SatBody;

  model Body
    parameter Real ixx;
    Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(visible = true, transformation(origin = {-94, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-94, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Components.Inertia BodyInertia(J = ixx) annotation(Placement(visible = true, transformation(origin = {-38, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Sensors.AngleSensor anglesensor1 annotation(Placement(visible = true, transformation(origin = {-8, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput angle annotation(Placement(visible = true, transformation(origin = {98, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {-96, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-96, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {-94, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-94, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 100000) annotation(Placement(visible = true, transformation(origin = {-64, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(Placement(visible = true, transformation(origin = {92, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {92, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a Heat_a annotation(Placement(visible = true, transformation(origin = {-96, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-96, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b Heat_b annotation(Placement(visible = true, transformation(origin = {92, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {92, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatcapacitor1(C = 10, T(start = 20)) annotation(Placement(visible = true, transformation(origin = {-8, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Components.ThermalResistor thermalresistor1(R = 0.2) annotation(Placement(visible = true, transformation(origin = {-64, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedtemperature1(T = 40) annotation(Placement(visible = true, transformation(origin = {66, -88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Components.BodyRadiation bodyradiation1(Gr = 2) annotation(Placement(visible = true, transformation(origin = {66, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Components.ThermalResistor thermalresistor2(R = 0.2) annotation(Placement(visible = true, transformation(origin = {34, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperaturesensor1 annotation(Placement(visible = true, transformation(origin = {58, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput temp annotation(Placement(visible = true, transformation(origin = {98, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(flange_a, BodyInertia.flange_a) annotation(Line(points = {{-94, 6}, {-48, 6}, {-48, 6}, {-48, 6}}));
    connect(bodyradiation1.port_a, heatcapacitor1.port) annotation(Line(points = {{56, -58}, {-8, -58}, {-8, -24}, {-8, -24}}, color = {191, 0, 0}));
    connect(temperaturesensor1.T, temp) annotation(Line(points = {{68, 74}, {90, 74}, {90, 74}, {90, 74}}, color = {0, 0, 127}));
    connect(heatcapacitor1.port, temperaturesensor1.port) annotation(Line(points = {{-8, -24}, {-8, -24}, {-8, -28}, {10, -28}, {10, 74}, {48, 74}, {48, 74}}, color = {191, 0, 0}));
    connect(thermalresistor2.port_b, Heat_b) annotation(Line(points = {{44, -34}, {68, -34}, {68, -36}, {92, -36}}, color = {191, 0, 0}));
    connect(heatcapacitor1.port, thermalresistor2.port_a) annotation(Line(points = {{-8, -24}, {-8, -34}, {24, -34}}, color = {191, 0, 0}));
    connect(bodyradiation1.port_b, fixedtemperature1.port) annotation(Line(points = {{76, -58}, {82, -58}, {82, -88}, {76, -88}}, color = {191, 0, 0}));
    connect(thermalresistor1.port_b, heatcapacitor1.port) annotation(Line(points = {{-54, -34}, {-8, -34}, {-8, -24}, {-8, -24}}, color = {191, 0, 0}));
    connect(thermalresistor1.port_a, Heat_a) annotation(Line(points = {{-74, -34}, {-92, -34}, {-92, -34}, {-92, -34}}, color = {191, 0, 0}));
    connect(flange_b, BodyInertia.flange_b) annotation(Line(points = {{92, 26}, {-24, 26}, {-24, 6}, {-28, 6}, {-28, 6}}));
    connect(resistor1.n, pin_n) annotation(Line(points = {{-54, 82}, {16, 82}, {16, -82}, {-94, -82}}, color = {0, 0, 255}));
    connect(pin_p, resistor1.p) annotation(Line(points = {{-96, 82}, {-74, 82}}, color = {0, 0, 255}));
    connect(anglesensor1.phi, angle) annotation(Line(points = {{3, 6}, {90, 6}, {90, 4}, {90, 4}}, color = {0, 0, 127}));
    connect(BodyInertia.flange_b, anglesensor1.flange) annotation(Line(points = {{-28, 6}, {-18, 6}, {-18, 6}, {-18, 6}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end Body;

  model PVPanel
    parameter Real pvGain;
    Modelica.Blocks.Math.Abs abs1 annotation(Placement(visible = true, transformation(origin = {-26, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Cos cos1 annotation(Placement(visible = true, transformation(origin = {-58, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 0.01) annotation(Placement(visible = true, transformation(origin = {44, 12}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Sensors.VoltageSensor voltagesensor1 annotation(Placement(visible = true, transformation(origin = {86, 8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Sensors.CurrentSensor currentsensor1 annotation(Placement(visible = true, transformation(origin = {44, -48}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Sources.SignalCurrent signalcurrent1 annotation(Placement(visible = true, transformation(origin = {44, 44}, extent = {{10, 10}, {-10, -10}}, rotation = -90)));
    Modelica.Electrical.Analog.Sources.SignalCurrent signalcurrent2 annotation(Placement(visible = true, transformation(origin = {44, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    Modelica.Blocks.Math.Gain gain1(k = pvGain) annotation(Placement(visible = true, transformation(origin = {8, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Semiconductors.Diode diode1(Vt = 0.58) annotation(Placement(visible = true, transformation(origin = {10, 44}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Semiconductors.Diode diode2(Vt = 0.58) annotation(Placement(visible = true, transformation(origin = {2, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {96, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {82, -82}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput current annotation(Placement(visible = true, transformation(origin = {102, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput volts annotation(Placement(visible = true, transformation(origin = {100, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {88, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {93, 95}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {93, 95}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Sensors.AngleSensor anglesensor1 annotation(Placement(visible = true, transformation(origin = {-66, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(visible = true, transformation(origin = {-92, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(anglesensor1.phi, cos1.u) annotation(Line(points = {{-55, 24}, {-44, 24}, {-44, 54}, {-78, 54}, {-78, 80}, {-70, 80}, {-70, 80}}, color = {0, 0, 127}));
    connect(flange_a, anglesensor1.flange) annotation(Line(points = {{-92, 24}, {-76, 24}, {-76, 24}, {-76, 24}}));
    connect(signalcurrent1.n, pin_p) annotation(Line(points = {{44, 54}, {44, 95}, {93, 95}}, color = {0, 0, 255}));
    connect(pin_p, voltagesensor1.p) annotation(Line(points = {{93, 95}, {86, 95}, {86, 18}}, color = {0, 0, 255}));
    connect(signalcurrent2.p, currentsensor1.p) annotation(Line(points = {{44, -30}, {44, -30}, {44, -38}, {44, -38}}, color = {0, 0, 255}));
    connect(resistor1.n, signalcurrent2.n) annotation(Line(points = {{44, 2}, {44, 2}, {44, -10}, {44, -10}}, color = {0, 0, 255}));
    connect(diode2.n, signalcurrent2.p) annotation(Line(points = {{2, -30}, {44, -30}, {44, -30}, {44, -30}}, color = {0, 0, 255}));
    connect(diode2.p, signalcurrent2.n) annotation(Line(points = {{2, -10}, {44, -10}}, color = {0, 0, 255}));
    connect(signalcurrent1.p, resistor1.p) annotation(Line(points = {{44, 34}, {44, 34}, {44, 22}, {44, 22}}, color = {0, 0, 255}));
    connect(signalcurrent1.p, diode1.n) annotation(Line(points = {{44, 34}, {10, 34}, {10, 34}, {10, 34}}, color = {0, 0, 255}));
    connect(diode1.p, signalcurrent1.n) annotation(Line(points = {{10, 54}, {44, 54}, {44, 54}, {44, 54}}, color = {0, 0, 255}));
    connect(gain1.y, signalcurrent1.i) annotation(Line(points = {{19, 80}, {28, 80}, {28, 44}, {36, 44}, {36, 44}}, color = {0, 0, 127}));
    connect(abs1.y, gain1.u) annotation(Line(points = {{-15, 80}, {-4, 80}}, color = {0, 0, 127}));
    connect(gain1.y, signalcurrent2.i) annotation(Line(points = {{19, 80}, {28, 80}, {28, -20}, {37, -20}}, color = {0, 0, 127}));
    connect(currentsensor1.i, current) annotation(Line(points = {{34, -48}, {20, -48}, {20, -66}, {74, -66}, {74, -50}, {96, -50}, {96, -50}}, color = {0, 0, 127}));
    connect(currentsensor1.n, pin_n) annotation(Line(points = {{44, -58}, {46, -58}, {46, -84}, {96, -84}}, color = {0, 0, 255}));
    connect(voltagesensor1.v, volts) annotation(Line(points = {{76, 8}, {72, 8}, {72, 50}, {94, 50}, {94, 50}}, color = {0, 0, 127}));
    connect(voltagesensor1.n, pin_n) annotation(Line(points = {{86, -2}, {86, -84}, {96, -84}}, color = {0, 0, 255}));
    connect(cos1.y, abs1.u) annotation(Line(points = {{-47, 80}, {-38, 80}}, color = {0, 0, 127}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end PVPanel;

  model Shelf
    parameter Real dist = 500;
    Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(visible = true, transformation(origin = {-94, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-94, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {-96, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-96, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {-94, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-94, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 100000) annotation(Placement(visible = true, transformation(origin = {-64, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(Placement(visible = true, transformation(origin = {92, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {92, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a Heat_a annotation(Placement(visible = true, transformation(origin = {-94, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-96, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatcapacitor1(C = 1, der_T(start = 0), T(start = 20)) annotation(Placement(visible = true, transformation(origin = {-12, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Components.ThermalResistor LoadToShelf(R = (1000.0 - dist) * 0.1) annotation(Placement(visible = true, transformation(origin = {56, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Components.ThermalResistor thermalresistor1(R = 0.1) annotation(Placement(visible = true, transformation(origin = {-52, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b Heat_b annotation(Placement(visible = true, transformation(origin = {94, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {94, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(flange_a, flange_b) annotation(Line(points = {{-94, 6}, {92, 6}, {92, 8}, {92, 8}}));
    connect(LoadToShelf.port_b, Heat_b) annotation(Line(points = {{66, -32}, {92, -32}, {92, -30}, {92, -30}}, color = {191, 0, 0}));
    connect(heatcapacitor1.port, LoadToShelf.port_a) annotation(Line(points = {{-12, -30}, {-12, -30}, {-12, -32}, {46, -32}, {46, -32}}, color = {191, 0, 0}));
    connect(thermalresistor1.port_b, heatcapacitor1.port) annotation(Line(points = {{-42, -32}, {-12, -32}, {-12, -30}, {-12, -30}}, color = {191, 0, 0}));
    connect(thermalresistor1.port_a, Heat_a) annotation(Line(points = {{-62, -32}, {-92, -32}, {-92, -32}, {-92, -32}}, color = {191, 0, 0}));
    connect(LoadToShelf.port_b, heatcapacitor1.port) annotation(Line(points = {{-56, -32}, {-20, -32}}, color = {191, 0, 0}));
    connect(LoadToShelf.port_a, Heat_a) annotation(Line(points = {{-76, -32}, {-94, -32}}, color = {191, 0, 0}));
    connect(resistor1.n, pin_n) annotation(Line(points = {{-54, 82}, {16, 82}, {16, -82}, {-94, -82}}, color = {0, 0, 255}));
    connect(pin_p, resistor1.p) annotation(Line(points = {{-96, 82}, {-74, 82}}, color = {0, 0, 255}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end Shelf;

  model Cargo
    Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(visible = true, transformation(origin = {-94, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-94, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {-96, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-96, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {-94, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-94, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 100000) annotation(Placement(visible = true, transformation(origin = {-64, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(Placement(visible = true, transformation(origin = {92, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {92, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_c annotation(Placement(visible = true, transformation(origin = {92, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {92, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Components.SpringDamper springdamper1(c = 1000, d = 1000) annotation(Placement(visible = true, transformation(origin = {-38, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(springdamper1.flange_b, flange_c) annotation(Line(points = {{-28, 8}, {-2, 8}, {-2, -36}, {92, -36}, {92, -36}}));
    connect(springdamper1.flange_b, flange_b) annotation(Line(points = {{-28, 8}, {92, 8}, {92, 8}, {92, 8}}));
    connect(flange_a, springdamper1.flange_a) annotation(Line(points = {{-94, 6}, {-48, 6}, {-48, 8}, {-48, 8}}));
    connect(resistor1.n, pin_n) annotation(Line(points = {{-54, 82}, {16, 82}, {16, -82}, {-94, -82}}, color = {0, 0, 255}));
    connect(pin_p, resistor1.p) annotation(Line(points = {{-96, 82}, {-74, 82}}, color = {0, 0, 255}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end Cargo;

  model BatteryV2
    parameter Real CEquivalent = 100;
    Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 0.05) annotation(Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = CEquivalent, v(start = 18)) annotation(Placement(visible = true, transformation(origin = {-60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Sensors.CurrentSensor currentsensor1 annotation(Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Sensors.VoltageSensor voltagesensor1 annotation(Placement(visible = true, transformation(origin = {40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput i annotation(Placement(visible = true, transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput v annotation(Placement(visible = true, transformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(Placement(visible = true, transformation(origin = {94, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {94, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {-4, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a Heat_a annotation(Placement(visible = true, transformation(origin = {-98, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-98, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalconductor1(G = 1) annotation(Placement(visible = true, transformation(origin = {-40, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatcapacitor1(C = 10, T(start = 20)) annotation(Placement(visible = true, transformation(origin = {-4, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperaturesensor1 annotation(Placement(visible = true, transformation(origin = {18, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput temp "Internal Temperature" annotation(Placement(visible = true, transformation(origin = {94, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 0.01) annotation(Placement(visible = true, transformation(origin = {74, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(inertia1.flange_b, flange_b) annotation(Line(points = {{84, 6}, {94, 6}}));
    connect(temperaturesensor1.T, temp) annotation(Line(points = {{28, -24}, {88, -24}, {88, -26}, {88, -26}}, color = {0, 0, 127}));
    connect(heatcapacitor1.port, temperaturesensor1.port) annotation(Line(points = {{-4, 0}, {-2, 0}, {-2, -24}, {8, -24}, {8, -24}}, color = {191, 0, 0}));
    connect(thermalconductor1.port_b, heatcapacitor1.port) annotation(Line(points = {{-30, -6}, {-4, -6}, {-4, 0}, {-4, 0}}, color = {191, 0, 0}));
    connect(Heat_a, thermalconductor1.port_a) annotation(Line(points = {{-98, -6}, {-50, -6}, {-50, -6}, {-50, -6}}, color = {191, 0, 0}));
    connect(ground1.p, capacitor1.n) annotation(Line(points = {{-4, -50}, {-20, -50}, {-20, -68}, {-60, -68}, {-60, -50}, {-60, -50}}, color = {0, 0, 255}));
    connect(currentsensor1.i, i) annotation(Line(points = {{-40, 50}, {-40.3732, 50}, {-40.3732, 49.1942}, {6.78541, 49.1942}, {6.78541, 91.6031}, {79.05, 91.6031}, {79.05, 79.05}, {93.97790000000001, 79.05}, {93.97790000000001, 79.05}}));
    connect(voltagesensor1.v, v) annotation(Line(points = {{40, 50}, {40.3732, 50}, {40.3732, -88.2103}, {80.4071, -88.2103}, {80.4071, -79.38930000000001}, {91.9423, -79.38930000000001}, {91.9423, -79.38930000000001}}));
    connect(voltagesensor1.n, pin_n) annotation(Line(points = {{50, 60}, {54.6226, 60}, {54.6226, -81.0857}, {-98.0492, -81.0857}, {-98.0492, -81.0857}}));
    connect(pin_p, voltagesensor1.p) annotation(Line(points = {{-100, 80}, {29.8558, 80}, {29.8558, 60.7294}, {29.8558, 60.7294}}));
    connect(currentsensor1.p, resistor1.p) annotation(Line(points = {{-50, 60}, {-60.0509, 60}, {-60.0509, 29.1773}, {-59.0331, 29.1773}, {-59.0331, 29.1773}}));
    connect(pin_p, currentsensor1.n) annotation(Line(points = {{-100, 80}, {-26.4631, 80}, {-26.4631, 60.3902}, {-29.1773, 60.3902}, {-29.1773, 60.3902}}));
    connect(capacitor1.n, pin_n) annotation(Line(points = {{-60, -50}, {-60, -80.5616}, {-100.864, -80.5616}, {-100.864, -80.5616}}));
    connect(capacitor1.p, resistor1.n) annotation(Line(points = {{-60, -30}, {-60, 11.6631}, {-59.8272, 11.6631}, {-59.8272, 10}, {-60, 10}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end BatteryV2;

  model TestStateMachine
    Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 10) annotation(Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {0, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Resistor resistor2(R = 0.1) annotation(Placement(visible = true, transformation(origin = {40, -60}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
    Modelica.Electrical.Analog.Basic.Resistor resistor3(R = 100) annotation(Placement(visible = true, transformation(origin = {80, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Sources.ConstantVoltage constantvoltage1(V = 100) annotation(Placement(visible = true, transformation(origin = {-60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = 1) annotation(Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Sensors.VoltageSensor voltagesensor1 annotation(Placement(visible = true, transformation(origin = {-20, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    TbLib.SM_switch sm_switch1 annotation(Placement(visible = true, transformation(origin = {-20, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    inner Modelica.StateGraph.StateGraphRoot stateGraphRoot annotation(Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Ideal.IdealClosingSwitch idealclosingswitch1 annotation(Placement(visible = true, transformation(origin = {40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    TbLib.ParallelStates parallelstates1 annotation(Placement(visible = true, transformation(origin = {60, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(sm_switch1.y, idealclosingswitch1.control) annotation(Line(points = {{-16, 66}, {39.5366, 66}, {39.5366, -32.0058}, {40.1159, -32.0058}, {40.1159, -32.0058}}, color = {255, 0, 255}));
    connect(idealclosingswitch1.n, resistor2.p) annotation(Line(points = {{50, -40}, {58.3635, -40}, {58.3635, -54.8878}, {39.5366, -54.8878}, {39.5366, -54.8878}}, color = {0, 0, 255}));
    connect(resistor1.n, idealclosingswitch1.p) annotation(Line(points = {{-30, -20}, {30.2679, -20}, {30.2679, -40.4055}, {30.2679, -40.4055}}, color = {0, 0, 255}));
    connect(voltagesensor1.v, sm_switch1.v) annotation(Line(points = {{-30, -40}, {-30, -39.0036}, {-44.7145, -39.0036}, {-44.7145, 66.2211}, {-26.61, 66.2211}, {-26.61, 66.2211}}, color = {0, 0, 127}));
    connect(voltagesensor1.n, ground1.p) annotation(Line(points = {{-20, -50}, {-20, -69.6233}, {0.121507, -69.6233}, {0.121507, -69.6233}}, color = {0, 0, 255}));
    connect(resistor1.n, voltagesensor1.p) annotation(Line(points = {{-30, -20}, {-20.1701, -20}, {-20.1701, -29.6476}, {-19.9271, -29.6476}, {-19.9271, -29.6476}}, color = {0, 0, 255}));
    connect(resistor1.n, resistor3.p) annotation(Line(points = {{-30, -20}, {80.1944, -20}, {80.1944, -29.6476}, {80.1944, -29.6476}}, color = {0, 0, 255}));
    connect(capacitor1.n, ground1.p) annotation(Line(points = {{6.12303e-16, -50}, {6.12303e-16, -69.6233}, {-0.121507, -69.6233}, {-0.121507, -69.6233}}, color = {0, 0, 255}));
    connect(resistor1.n, capacitor1.p) annotation(Line(points = {{-30, -20}, {-10.3281, -20}, {-6.12303e-16, -20}, {-6.12303e-16, -30}}, color = {0, 0, 255}));
    connect(constantvoltage1.p, resistor1.p) annotation(Line(points = {{-60, -30}, {-60, -20.1701}, {-50.9113, -20.1701}, {-50.9113, -20.1701}}, color = {0, 0, 255}));
    connect(constantvoltage1.n, ground1.p) annotation(Line(points = {{-60, -50}, {-60, -69.0158}, {-0.72904, -69.0158}, {-0.72904, -69.0158}}, color = {0, 0, 255}));
    connect(resistor3.n, ground1.p) annotation(Line(points = {{80, -50}, {80, -69.8663}, {0.121507, -69.8663}, {0.121507, -69.8663}}, color = {0, 0, 255}));
    connect(resistor2.n, ground1.p) annotation(Line(points = {{40, -65}, {40, -69.8663}, {-0.121507, -69.8663}, {-0.121507, -69.8663}}, color = {0, 0, 255}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end TestStateMachine;

  model SM_switch
    Modelica.Blocks.Interfaces.RealInput v annotation(Placement(visible = true, transformation(origin = {-60, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.BooleanOutput y annotation(Placement(visible = true, transformation(origin = {40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.StateGraph.InitialStep initialstep1 annotation(Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.StateGraph.Transition transition1(condition = v > 0) annotation(Placement(visible = true, transformation(origin = {-20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.StateGraph.Step Charge(nIn = 2) annotation(Placement(visible = true, transformation(origin = {20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.StateGraph.Step Discharge annotation(Placement(visible = true, transformation(origin = {20, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.StateGraph.Transition transition2(condition = v > 30) annotation(Placement(visible = true, transformation(origin = {60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.StateGraph.Transition transition3(condition = v < 2) annotation(Placement(visible = true, transformation(origin = {60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.BooleanExpression booleanexpression1(y = Discharge.active) annotation(Placement(visible = true, transformation(origin = {-5, 75}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  equation
    connect(booleanexpression1.y, y) annotation(Line(points = {{11.5, 75}, {19.9541, 75}, {19.9541, 60.5402}, {30.5123, 60.5402}, {30.5123, 60.5402}}, color = {255, 0, 255}));
    connect(Discharge.outPort[1], transition3.inPort) annotation(Line(points = {{30.5, -20}, {55.5033, -20}, {55.5033, -20.2447}, {55.5033, -20.2447}}));
    connect(transition3.outPort, Charge.inPort[2]) annotation(Line(points = {{61.5, -20}, {71.6796, -20}, {71.6796, -37.0991}, {-6.68364, -37.0991}, {-6.68364, 20.1478}, {8.23347, 20.1478}, {8.23347, 20.1478}}));
    connect(transition2.outPort, Discharge.inPort[1]) annotation(Line(points = {{61.5, 20}, {66.449, 20}, {66.449, 0.0968644}, {6.58678, 0.0968644}, {6.58678, -19.8572}, {8.23347, -19.8572}, {8.23347, -19.8572}}));
    connect(Charge.outPort[1], transition2.inPort) annotation(Line(points = {{30.5, 20}, {56.2782, 20}, {56.2782, 20.3415}, {56.2782, 20.3415}}));
    connect(transition1.outPort, Charge.inPort[1]) annotation(Line(points = {{-18.5, 20}, {8.13661, 20}, {8.13661, 19.6635}, {8.13661, 19.6635}}));
    connect(Discharge.outPort[1], transition3.inPort) annotation(Line(points = {{30.5, -20}, {55.5286, -20}, {55.5286, -19.9271}, {55.5286, -19.9271}}));
    connect(transition2.outPort, Discharge.inPort[1]) annotation(Line(points = {{61.5, 20}, {75.4557, 20}, {75.4557, -1.8226}, {1.09356, -1.8226}, {1.09356, -19.9271}, {8.01944, -19.9271}, {8.01944, -19.9271}}));
    connect(initialstep1.outPort[1], transition1.inPort) annotation(Line(points = {{-49.5, 20}, {-24.3013, 20}, {-24.3013, 20.2916}, {-24.3013, 20.2916}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end SM_switch;

  model ParallelStates
    Modelica.StateGraph.Step step2 annotation(Placement(visible = true, transformation(origin = {0, 40}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.StateGraph.Transition transition5(enableTimer = true, waitTime = 0.1) annotation(Placement(visible = true, transformation(origin = {60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.StateGraph.Transition transition6(enableTimer = true, waitTime = 0.0) annotation(Placement(visible = true, transformation(origin = {-60, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.StateGraph.Step step3 annotation(Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.StateGraph.Transition transition1(enableTimer = true, waitTime = 2.0) annotation(Placement(visible = true, transformation(origin = {80, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.StateGraph.InitialStep initialstep1 annotation(Placement(visible = true, transformation(origin = {-80, -20}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Sources.BooleanExpression booleanexpression2(y = step3.active) annotation(Placement(visible = true, transformation(origin = {-20, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.StateGraph.Parallel parallel1 annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-45, -45}, {45, 45}}, rotation = 0)));
    Modelica.Blocks.Sources.BooleanExpression booleanexpression1(y = step1.active) annotation(Placement(visible = true, transformation(origin = {20, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.BooleanOutput step1Act annotation(Placement(visible = true, transformation(origin = {100, -60}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.BooleanOutput Step3Act annotation(Placement(visible = true, transformation(origin = {100, -80}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.BooleanExpression booleanexpression3(y = step2.active) annotation(Placement(visible = true, transformation(origin = {20, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.BooleanOutput Step2Act annotation(Placement(visible = true, transformation(origin = {100, -100}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.StateGraph.Step step1 annotation(Placement(visible = true, transformation(origin = {-20, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.StateGraph.Transition transition2(enableTimer = true, waitTime = 0.3) annotation(Placement(visible = true, transformation(origin = {0, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.StateGraph.Step step4 annotation(Placement(visible = true, transformation(origin = {0, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.StateGraph.Step step5 annotation(Placement(visible = true, transformation(origin = {20, 80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.StateGraph.Transition transition3(enableTimer = true, waitTime = 0.4) annotation(Placement(visible = true, transformation(origin = {20, 60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  equation
    connect(transition3.outPort, step5.inPort[1]) annotation(Line(points = {{20.75, 60}, {29.959, 60}, {29.959, 71.2722}, {12.8591, 71.2722}, {12.8591, 80.7114}, {14.6375, 80.7114}, {14.6375, 79.8906}, {14.6375, 79.8906}}));
    connect(step5.outPort[1], parallel1.join[1]) annotation(Line(points = {{25.25, 80}, {35.1573, 80}, {35.1573, 55.2668}, {25.171, 55.2668}, {25.171, 37.0725}, {33.5157, 37.0725}, {33.5157, 37.0725}}));
    connect(step4.outPort[1], transition3.inPort) annotation(Line(points = {{5.25, 80}, {10.8071, 80}, {10.8071, 60.0547}, {17.9207, 60.0547}, {17.9207, 60.0547}}));
    connect(transition2.outPort, step4.inPort[1]) annotation(Line(points = {{0.75, 60}, {9.57592, 60}, {9.57592, 70.3146}, {-9.57592, 70.3146}, {-9.57592, 80.4378}, {-6.56635, 80.4378}, {-6.56635, 80.4378}}));
    connect(step1.outPort[1], transition2.inPort) annotation(Line(points = {{-14.75, 60}, {-1.91518, 60}, {-1.91518, 59.6443}, {-1.91518, 59.6443}}));
    connect(parallel1.split[1], step1.inPort[1]) annotation(Line(points = {{-34.875, 0}, {-27.3598, 0}, {-27.3598, 60.0547}, {-25.171, 60.0547}, {-25.171, 60.0547}}));
    connect(booleanexpression3.y, Step2Act) annotation(Line(points = {{31, -100}, {97.4061, -100}, {97.4061, -99.9209}, {97.4061, -99.9209}}, color = {255, 0, 255}));
    connect(booleanexpression2.y, Step3Act) annotation(Line(points = {{-9, -80}, {-2.94033, -80}, {4.26872, -80.2247}, {100, -80}, {100, -80}}, color = {255, 0, 255}));
    connect(booleanexpression1.y, step1Act) annotation(Line(points = {{31, -60}, {91.5513, -60}, {90.2762, -60.0494}, {100, -60}}, color = {255, 0, 255}));
    connect(parallel1.split[2], step2.inPort[1]) annotation(Line(points = {{-34.875, 0}, {-23.1304, 0}, {-23.1304, 39.5113}, {-5.91532, 39.5113}, {-5.91532, 40}, {-5.5, 40}}));
    connect(step2.outPort[1], parallel1.join[2]) annotation(Line(points = {{5.25, 40}, {16.5326, 40}, {16.5326, 5.4603}, {34.875, 5.4603}, {34.875, 0}}));
    connect(transition6.outPort, parallel1.inPort) annotation(Line(points = {{-59.25, -20}, {-46.7917, -20}, {-46.35, -20}, {-46.35, 0}}));
    connect(parallel1.outPort, transition5.inPort) annotation(Line(points = {{45.9, 0}, {49.6505, 0}, {49.6505, -39.5286}, {56, -39.5286}, {56, -40}}));
    connect(transition1.outPort, initialstep1.inPort[1]) annotation(Line(points = {{81.5, 60}, {93.8234, 60}, {93.8234, 75.9141}, {-90.7494, 75.9141}, {-90.7494, -20.4487}, {-85.6706, -20.4487}, {-85.6706, -20.4487}}));
    connect(step3.outPort[1], transition1.inPort) annotation(Line(points = {{90.5, 0}, {93.8234, 0}, {93.8234, 31.8091}, {64.1527, 31.8091}, {64.1527, 59.6086}, {74.8449, 59.6086}, {74.8449, 59.6086}}));
    connect(initialstep1.outPort[1], transition6.inPort) annotation(Line(points = {{-74.75, -20}, {-71.5147, -20}, {-71.5147, -19.9453}, {-62, -19.9453}, {-62, -20}}));
    connect(transition5.outPort, step3.inPort[1]) annotation(Line(points = {{61.5, -40}, {75.61, -40}, {75.61, -20.3244}, {61.2767, -20.3244}, {61.2767, -0.151675}, {68.3296, -0.151675}, {68.3296, -0.151675}}));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end ParallelStates;
equation
  connect(tbload1.pin_n, src1.pin_n) annotation(Line(points = {{14, 40}, {-14.6172, 40}, {-14.6172, 38.3207}, {-20, 38.3207}, {-20, 38}}));
  connect(src1.pin_p, tbload1.pin_p) annotation(Line(points = {{-20, 44}, {12.5807, 44}, {12.5807, 41.4422}, {14, 41.4422}, {14, 42}}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), uses(Modelica(version = "3.2.1")));
end TbLib;