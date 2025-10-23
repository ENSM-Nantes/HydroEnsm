------- OpenFAST EXAMPLE INPUT FILE -------------------------------------------
FAST Certification Test #25: NREL 5.0 MW Baseline Wind Turbine with OC4-DeepCwind semi configuration, for use in offshore analysis
---------------------- SIMULATION CONTROL --------------------------------------
Echo          True            - Echo input data to <RootName>.ech (flag)
AbortLevel    "FATAL"         - Error level when simulation should abort (string) {"WARNING", "SEVERE", "FATAL"}
TMax          60              - Total run time (s)
DT            0.0125          - Recommended module time step (s)
InterpOrder   2               - Interpolation order for input/output time history (-) {1=linear, 2=quadratic}
NumCrctn      0               - Number of correction iterations (-) {0=explicit calculation, i.e., no corrections}
DT_UJac       99999           - Time between calls to get Jacobians (s)
UJacSclFact   1E+06           - Scaling factor used in Jacobians (-)

---------------------- FEATURE SWITCHES AND FLAGS ------------------------------
CompElast     1               - Compute structural dynamics (switch) {1=ElastoDyn; 2=ElastoDyn + BeamDyn for blades}
CompInflow    1               - Compute inflow wind velocities (switch) {0=still air; 1=InflowWind; 2=external from OpenFOAM}
CompAero      2               - Compute aerodynamic loads (switch) {0=None; 1=AeroDyn v14; 2=AeroDyn v15}
CompServo     1               - Compute control and electrical-drive dynamics (switch) {0=None; 1=ServoDyn}
CompHydro     1               - Compute hydrodynamic loads (switch) {0=None; 1=HydroDyn}
CompSub       0               - Compute sub-structural dynamics (switch) {0=None; 1=SubDyn; 2=External Platform MCKF}
CompMooring   3               - Compute mooring system (switch) {0=None; 1=MAP++; 2=FEAMooring; 3=MoorDyn; 4=OrcaFlex}
CompIce       0               - Compute ice loads (switch) {0=None; 1=IceFloe; 2=IceDyn}
MHK           0               - MHK turbine type (switch) {0=Not an MHK turbine; 1=Fixed MHK turbine; 2=Floating MHK turbine}

---------------------- ENVIRONMENTAL CONDITIONS --------------------------------
Gravity       9.80665         - Gravitational acceleration (m/s^2)
AirDens       1.225           - Air density (kg/m^3)
WtrDens       1025            - Water density (kg/m^3)
KinVisc       1.464E-05       - Kinematic viscosity of working fluid (m^2/s)
SpdSound      335             - Speed of sound in working fluid (m/s)
Patm          103500          - Atmospheric pressure (Pa) [used only for an MHK turbine cavitation check]
Pvap          1700            - Vapour pressure of working fluid (Pa) [used only for an MHK turbine cavitation check]
WtrDpth       200             - Water depth (m)
MSL2SWL       0               - Offset between still-water level and mean sea level (m) [positive upward]

---------------------- INPUT FILES ---------------------------------------------
EDFile        "NRELOffshrBsline5MW_OC4DeepCwindSemi_ElastoDyn.dat"         - ElastoDyn input file
BDBldFile(1)  "../5MW_Baseline/NRELOffshrBsline5MW_BeamDyn.dat"           - BeamDyn input blade 1
BDBldFile(2)  "../5MW_Baseline/NRELOffshrBsline5MW_BeamDyn.dat"           - BeamDyn input blade 2
BDBldFile(3)  "../5MW_Baseline/NRELOffshrBsline5MW_BeamDyn.dat"           - BeamDyn input blade 3
InflowFile    "../5MW_Baseline/NRELOffshrBsline5MW_InflowWind_Steady8mps.dat" - InflowWind input file
AeroFile      "NRELOffshrBsline5MW_OC3Hywind_AeroDyn15.dat"               - AeroDyn input file
ServoFile     "NRELOffshrBsline5MW_OC4DeepCwindSemi_ServoDyn.dat"         - ServoDyn input file
HydroFile     "NRELOffshrBsline5MW_OC4DeepCwindSemi_HydroDyn.dat"         - HydroDyn input file
SubFile       "unused"                                                    - SubDyn input file
MooringFile   "NRELOffshrBsline5MW_OC4DeepCwindSemi_MoorDyn.dat"          - MoorDyn input file
IceFile       "unused"                                                    - IceDyn input file

---------------------- OUTPUT --------------------------------------------------
SumPrint      True            - Print summary data to "<RootName>.sum" (flag)
SttsTime      1               - Time between screen status messages (s)
ChkptTime     1000            - Time between checkpoint files (s)
DT_Out        0.0125          - Time step for tabular output (s)
TStart        0               - Time to begin tabular output (s)
OutFileFmt    0               - Format for tabular output {0=binary, 1=text, 2=binary, 3=both}
TabDelim      True            - Use tab delimiters in text output (flag)
OutFmt        "ES15.7E2"      - Format for text tabular output

---------------------- LINEARIZATION -------------------------------------------
Linearize     False           - Linearization analysis (flag)
CalcSteady    False           - Calculate steady-state before linearization? (flag)
TrimCase      3               - Controller parameter to be trimmed {1=yaw; 2=torque; 3=pitch}
TrimTol       0.001           - Tolerance for rotational speed convergence
TrimGain      0.01            - Proportional gain for rotational speed error
Twr_Kdmp      0               - Tower damping factor
Bld_Kdmp      0               - Blade damping factor
NLinTimes     2               - Number of times to linearize
LinTimes      30, 60          - List of times to linearize (s)
LinInputs     1               - Inputs included in linearization {0=none; 1=standard; 2=all}
LinOutputs    1               - Outputs included in linearization {0=none; 1=OutList; 2=all}
LinOutJac     False           - Include full Jacobians? (flag)
LinOutMod     False           - Write module-level linearization outputs? (flag)

---------------------- VISUALIZATION -------------------------------------------
WrVTK         0               - VTK visualization output {0=none; 1=init; 2=anim; 3=modes}
VTK_type      2               - Type of VTK output {1=surfaces; 2=basic; 3=debug}
VTK_fields    False           - Write mesh fields to VTK? (flag)
VTK_fps       15              - Frame rate for VTK output (fps)
