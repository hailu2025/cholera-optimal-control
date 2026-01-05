# CHOLERA OUTBREAK MODEL - MATLAB CODE
=====================================

This archive contains MATLAB code for the manuscript:
"Optimal Control of Cholera Outbreaks: A Cost-Effectiveness Analysis of 
Vaccination, Sanitation, and Treatment Strategies"

AUTHORS:
Hailu Tkue Welu, Yohannes Virga Kefela, Habtu Alemayehu Atsbaha
Department of Mathematics, Mekelle University, Ethiopia

CONTACT:
Hailu Tkue Welu
Email: hailu.tkue@mu.edu.et

STRUCTURE:
Figure2_Sensitivity.m              - Generates PRCC sensitivity bar chart (Fig 2)
Table3_ControlStrategies.m         - Generates Table 3: Control strategies comparison
Table4_ParameterSensitivity.m      - Generates Table 4: Parameter sensitivity analysis  
Table5_DeterministicStochastic.m   - Generates Table 5: Deterministic vs stochastic comparison

REQUIREMENTS:
- MATLAB R2018a or newer
- Basic MATLAB installation (no specialized toolboxes required)

QUICK START:
1. Download all four .m files to a single directory
2. Run each file individually in MATLAB:
   >> Figure2_Sensitivity
   >> Table3_ControlStrategies
   >> Table4_ParameterSensitivity
   >> Table5_DeterministicStochastic
3. Outputs will be displayed in MATLAB and saved as CSV/PNG files

OUTPUTS:
Each script generates:
- Formatted table display in MATLAB command window
- CSV file with numerical data
- Visualization plots (embedded in scripts)
- Figure2_Sensitivity.m also saves Figure2_Sensitivity.png

NOTES:
- All codes are independent and can run separately
- Based on data from manuscript Tables 2-5
- Uses only basic MATLAB functions for compatibility
- Parameters are hardcoded from manuscript results

NOTE FOR REVIEWERS - CODE SCOPE:
The submitted MATLAB code provides the core implementation for generating
the figures and tables in the manuscript. For submission size considerations:

1. Model simulation code is not included (available upon request)
2. Parameter values are hardcoded from manuscript results
3. Codes demonstrate figure/table generation methodology
4. Full model implementation with ODE solvers available from authors

The code demonstrates:
- Sensitivity analysis visualization (PRCC bar chart)
- Control strategy comparison formatting
- Parameter sensitivity table generation
- Deterministic-stochastic model comparison

Full reproduction of model simulations requires the complete codebase
(available from the authors upon reasonable request).

LICENSE:
This code is provided for reproducibility of the manuscript results.
For other uses, please contact the authors.

VERSION:
1.0 (January 2026)
