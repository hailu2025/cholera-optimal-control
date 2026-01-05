Please use this format "SMOKING DYNAMICS MODEL - MATLAB CODE
=====================================

This archive contains MATLAB code for the manuscript:
"Mathematical Modeling of Smoking Dynamics with Media Awareness: 
Bayesian Parameter Estimation, Global Sensitivity Analysis, 
and Optimal Control Strategies"

AUTHORS:
Abadi Abraha Asgedom, Yohannes Yirga Kefela, Hailu Tkue Welu
Department of Mathematics, Mekelle University, Ethiopia

CONTACT:
Abadi Abraha Asgedom
Email: abadi.abraha@mu.edu.et

STRUCTURE:
0_Main_Run_Script.m      - Master script to run all analyses
1_Model_Simulation/      - ODE model and simulation functions
2_Bayesian_Estimation/   - MCMC parameter estimation
3_Sensitivity_Analysis/  - Global sensitivity analysis (LHS, PRCC)
4_Optimal_Control/       - Optimal control problem solution
5_Figure_Generation/     - Code to generate manuscript figures
6_Data_Management/       - Data loading and preprocessing
7_Utilities/            - Helper functions and default parameters

REQUIREMENTS:
- MATLAB R2020a or newer
- Statistics and Machine Learning Toolbox
- Optimization Toolbox (for optimal control)
- Data file: S1_Data.csv (should be in parent directory)

QUICK START:
1. Ensure S1_Data.csv is in the parent directory
2. Run 0_Main_Run_Script.m in MATLAB
3. Results will be saved in Results/ folder
4. Figures will be saved in Figures/ folder

NOTES:
- Some functions are simplified for submission
- Full implementation available upon request
- MCMC results loaded from pre-computed file for speed

NOTE FOR REVIEWERS - FIGURE GENERATION:
The submitted MATLAB code (S1_Code.zip) provides the core implementation
of all analyses from the manuscript. For submission size and runtime
considerations:

1. Figure generation functions are simplified versions
2. Some analyses use reduced sample sizes (e.g., 1,000 LHS samples vs 10,000)
3. Random seeds may differ from manuscript results
4. Complete figure generation with identical visual output is available
   from the authors upon request.

The code demonstrates all methodological steps:
- Parameter estimation (Bayesian MCMC)
- Sensitivity analysis (LHS/PRCC/Sobol)
- Optimal control solution (forward-backward sweep)
- Model validation against empirical data

Full reproduction of manuscript figures requires the complete codebase
(available from the authors upon request).

LICENSE:
This code is provided for reproducibility of the manuscript results.
For other uses, please contact the authors.

VERSION:
1.0 (December 2023)
"
