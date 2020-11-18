% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 611.353223886082105 ; 625.893026796512345 ];

%-- Principal point:
cc = [ 343.309866481312554 ; 251.149402045134565 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.138532315104119 ; 1.013477415713039 ; 0.003359611372842 ; 0.008653368644180 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 16.150561725772185 ; 17.994425646541647 ];

%-- Principal point uncertainty:
cc_error = [ 22.823960257874788 ; 22.689214829957759 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.155126520749634 ; 0.850432452753166 ; 0.016699216507015 ; 0.016719428760086 ; 0.000000000000000 ];

%-- Image size:
nx = 640;
ny = 480;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 11;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 2.118559e+00 ; 2.016783e+00 ; -4.216475e-01 ];
Tc_1  = [ -1.319245e+01 ; -1.456182e+02 ; 6.192963e+02 ];
omc_error_1 = [ 3.777222e-02 ; 3.378608e-02 ; 7.708914e-02 ];
Tc_error_1  = [ 2.364846e+01 ; 2.250357e+01 ; 1.710905e+01 ];

%-- Image #2:
omc_2 = [ 2.256321e+00 ; 2.090926e+00 ; -3.988856e-01 ];
Tc_2  = [ -2.902941e+01 ; -1.586654e+02 ; 5.483267e+02 ];
omc_error_2 = [ 3.863642e-02 ; 3.420271e-02 ; 8.065457e-02 ];
Tc_error_2  = [ 2.103900e+01 ; 1.983668e+01 ; 1.615807e+01 ];

%-- Image #3:
omc_3 = [ -2.150244e+00 ; -1.849846e+00 ; 9.356260e-01 ];
Tc_3  = [ -8.155488e+01 ; -1.454191e+02 ; 6.104958e+02 ];
omc_error_3 = [ 4.028591e-02 ; 2.463128e-02 ; 6.979874e-02 ];
Tc_error_3  = [ 2.361474e+01 ; 2.249019e+01 ; 1.630795e+01 ];

%-- Image #4:
omc_4 = [ 1.695206e+00 ; 1.812006e+00 ; 1.994634e-01 ];
Tc_4  = [ -8.930366e+01 ; -1.830243e+02 ; 5.014875e+02 ];
omc_error_4 = [ 2.853982e-02 ; 3.180073e-02 ; 5.575399e-02 ];
Tc_error_4  = [ 1.953965e+01 ; 1.832704e+01 ; 1.767769e+01 ];

%-- Image #5:
omc_5 = [ 1.625430e+00 ; 1.704849e+00 ; -1.208238e+00 ];
Tc_5  = [ -7.044245e+01 ; -1.078615e+02 ; 6.448211e+02 ];
omc_error_5 = [ 3.051380e-02 ; 3.640413e-02 ; 5.411242e-02 ];
Tc_error_5  = [ 2.461025e+01 ; 2.381734e+01 ; 1.475845e+01 ];

%-- Image #6:
omc_6 = [ -1.897607e+00 ; -1.668978e+00 ; -5.285561e-01 ];
Tc_6  = [ -8.595917e+01 ; -3.026782e+01 ; 3.788291e+02 ];
omc_error_6 = [ 3.016703e-02 ; 3.210959e-02 ; 5.665421e-02 ];
Tc_error_6  = [ 1.430065e+01 ; 1.393344e+01 ; 1.170290e+01 ];

%-- Image #7:
omc_7 = [ -2.555691e+00 ; -6.193297e-01 ; -1.568549e+00 ];
Tc_7  = [ -1.292093e+02 ; 1.153585e+02 ; 3.751165e+02 ];
omc_error_7 = [ 4.188960e-02 ; 3.249448e-02 ; 4.922020e-02 ];
Tc_error_7  = [ 1.526459e+01 ; 1.413243e+01 ; 1.430925e+01 ];

%-- Image #8:
omc_8 = [ -4.225447e-01 ; -2.093064e+00 ; 4.062667e-03 ];
Tc_8  = [ 2.005219e+01 ; -7.540025e+01 ; 3.760726e+02 ];
omc_error_8 = [ 2.226578e-02 ; 3.933355e-02 ; 4.613467e-02 ];
Tc_error_8  = [ 1.402436e+01 ; 1.371980e+01 ; 1.193435e+01 ];

%-- Image #9:
omc_9 = [ -1.755452e+00 ; -1.527395e+00 ; -5.004332e-01 ];
Tc_9  = [ -9.847205e+01 ; -8.047608e+01 ; 3.960129e+02 ];
omc_error_9 = [ 2.999476e-02 ; 2.943898e-02 ; 5.173354e-02 ];
Tc_error_9  = [ 1.508055e+01 ; 1.451342e+01 ; 1.275648e+01 ];

%-- Image #10:
omc_10 = [ 1.969093e+00 ; 1.965164e+00 ; -1.604642e-01 ];
Tc_10  = [ -8.294386e+00 ; -6.970933e+01 ; 8.415827e+02 ];
omc_error_10 = [ 4.688541e-02 ; 3.770766e-02 ; 9.005444e-02 ];
Tc_error_10  = [ 3.148872e+01 ; 3.048944e+01 ; 2.429167e+01 ];

%-- Image #11:
omc_11 = [ 2.493888e+00 ; 1.765339e+00 ; 3.312188e-01 ];
Tc_11  = [ -9.754108e+01 ; -7.455129e+01 ; 7.065322e+02 ];
omc_error_11 = [ 6.177846e-02 ; 4.045895e-02 ; 1.080852e-01 ];
Tc_error_11  = [ 2.669512e+01 ; 2.575843e+01 ; 2.624950e+01 ];

