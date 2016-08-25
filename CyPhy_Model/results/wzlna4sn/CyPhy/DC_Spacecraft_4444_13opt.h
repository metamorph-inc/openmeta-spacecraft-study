#if defined(__cplusplus)
  extern "C" {
#endif
  int DC_Spacecraft_4444_mayer(DATA* data, modelica_real** res, short*);
  int DC_Spacecraft_4444_lagrange(DATA* data, modelica_real** res, short *, short *);
  int DC_Spacecraft_4444_pickUpBoundsForInputsInOptimization(DATA* data, modelica_real* min, modelica_real* max, modelica_real*nominal, modelica_boolean *useNominal, char ** name, modelica_real * start, modelica_real * startTimeOpt);
#if defined(__cplusplus)
}
#endif