/* Jacobians */
static const REAL_ATTRIBUTE dummyREAL_ATTRIBUTE = omc_dummyRealAttribute;
/* Jacobian Variables */
#if defined(__cplusplus)
extern "C" {
#endif
  #define DC_Spacecraft_22_INDEX_JAC_D 3
  int DC_Spacecraft_22_functionJacD_column(void* data);
  int DC_Spacecraft_22_initialAnalyticJacobianD(void* data);
#if defined(__cplusplus)
}
#endif
/* D */
/* D sparse indexes */

#if defined(__cplusplus)
extern "C" {
#endif
  #define DC_Spacecraft_22_INDEX_JAC_C 2
  int DC_Spacecraft_22_functionJacC_column(void* data);
  int DC_Spacecraft_22_initialAnalyticJacobianC(void* data);
#if defined(__cplusplus)
}
#endif
/* C */
/* C sparse indexes */

#if defined(__cplusplus)
extern "C" {
#endif
  #define DC_Spacecraft_22_INDEX_JAC_B 1
  int DC_Spacecraft_22_functionJacB_column(void* data);
  int DC_Spacecraft_22_initialAnalyticJacobianB(void* data);
#if defined(__cplusplus)
}
#endif
/* B */
/* B sparse indexes */

#if defined(__cplusplus)
extern "C" {
#endif
  #define DC_Spacecraft_22_INDEX_JAC_A 0
  int DC_Spacecraft_22_functionJacA_column(void* data);
  int DC_Spacecraft_22_initialAnalyticJacobianA(void* data);
#if defined(__cplusplus)
}
#endif
/* A */
#define $PDC_Spacecraft_cfg1$PBatteries$Pcapacitor1$Pv$pDERA$PDC_Spacecraft_cfg1$PBatteries$Pcapacitor1$Pv data->simulationInfo.analyticJacobians[0].seedVars[0]
#define $PDC_Spacecraft_cfg1$PBatteries$Pcapacitor1$Pv$pDERA$PDC_Spacecraft_cfg1$PBatteries$Pcapacitor1$Pv__varInfo dummyVAR_INFO
#define $PDC_Spacecraft_cfg1$PComputers$PPID$PD$Px$pDERA$PDC_Spacecraft_cfg1$PComputers$PPID$PD$Px data->simulationInfo.analyticJacobians[0].seedVars[1]
#define $PDC_Spacecraft_cfg1$PComputers$PPID$PD$Px$pDERA$PDC_Spacecraft_cfg1$PComputers$PPID$PD$Px__varInfo dummyVAR_INFO
#define $PDC_Spacecraft_cfg1$PComputers$PPID$PI$Py$pDERA$PDC_Spacecraft_cfg1$PComputers$PPID$PI$Py data->simulationInfo.analyticJacobians[0].seedVars[2]
#define $PDC_Spacecraft_cfg1$PComputers$PPID$PI$Py$pDERA$PDC_Spacecraft_cfg1$PComputers$PPID$PI$Py__varInfo dummyVAR_INFO
#define $PDC_Spacecraft_cfg1$PComputers$Pinertia1$Pphi$pDERA$PDC_Spacecraft_cfg1$PComputers$Pinertia1$Pphi data->simulationInfo.analyticJacobians[0].seedVars[3]
#define $PDC_Spacecraft_cfg1$PComputers$Pinertia1$Pphi$pDERA$PDC_Spacecraft_cfg1$PComputers$Pinertia1$Pphi__varInfo dummyVAR_INFO
#define $PDC_Spacecraft_cfg1$PComputers$Pinertia1$Pw$pDERA$PDC_Spacecraft_cfg1$PComputers$Pinertia1$Pw data->simulationInfo.analyticJacobians[0].seedVars[4]
#define $PDC_Spacecraft_cfg1$PComputers$Pinertia1$Pw$pDERA$PDC_Spacecraft_cfg1$PComputers$Pinertia1$Pw__varInfo dummyVAR_INFO
#define $PDC_Spacecraft_cfg1$PComputers$Pspringdamper1$Pphi_rel$pDERA$PDC_Spacecraft_cfg1$PComputers$Pspringdamper1$Pphi_rel data->simulationInfo.analyticJacobians[0].seedVars[5]
#define $PDC_Spacecraft_cfg1$PComputers$Pspringdamper1$Pphi_rel$pDERA$PDC_Spacecraft_cfg1$PComputers$Pspringdamper1$Pphi_rel__varInfo dummyVAR_INFO
/* A sparse indexes */
#define $PDC_Spacecraft_cfg1$PBatteries$Pcapacitor1$Pv$pDERA$indexdiff 0
#define $PDC_Spacecraft_cfg1$PComputers$PPID$PD$Px$pDERA$indexdiff 1
#define $PDC_Spacecraft_cfg1$PComputers$PPID$PI$Py$pDERA$indexdiff 2
#define $PDC_Spacecraft_cfg1$PComputers$Pinertia1$Pphi$pDERA$indexdiff 3
#define $PDC_Spacecraft_cfg1$PComputers$Pinertia1$Pw$pDERA$indexdiff 4
#define $PDC_Spacecraft_cfg1$PComputers$Pspringdamper1$Pphi_rel$pDERA$indexdiff 5
#define $PDC_Spacecraft_cfg1$PBatteries$Pcapacitor1$Pv$pDERA$indexdiffed 0
#define $PDC_Spacecraft_cfg1$PComputers$PPID$PD$Px$pDERA$indexdiffed 1
#define $PDC_Spacecraft_cfg1$PComputers$PPID$PI$Py$pDERA$indexdiffed 2
#define $PDC_Spacecraft_cfg1$PComputers$Pinertia1$Pphi$pDERA$indexdiffed 3
#define $PDC_Spacecraft_cfg1$PComputers$Pinertia1$Pw$pDERA$indexdiffed 4
#define $PDC_Spacecraft_cfg1$PComputers$Pspringdamper1$Pphi_rel$pDERA$indexdiffed 5


