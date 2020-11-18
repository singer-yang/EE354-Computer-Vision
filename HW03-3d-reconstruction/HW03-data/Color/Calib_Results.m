% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 534.017923460967836 ; 533.710173436171658 ];

%-- Principal point:
cc = [ 319.500000000000000 ; 239.500000000000000 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.041022455480686 ; -0.128866588164280 ; -0.001284592017964 ; -0.001508106597763 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 1.733079393328945 ; 1.838869997999964 ];

%-- Principal point uncertainty:
cc_error = [ 0.000000000000000 ; 0.000000000000000 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.014273048763391 ; 0.048268839510851 ; 0.000887292908072 ; 0.001363096322976 ; 0.000000000000000 ];

%-- Image size:
nx = 640;
ny = 480;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 11;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 0;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 2.139617e+00 ; 2.037558e+00 ; -5.324650e-01 ];
Tc_1  = [ 3.533154e+01 ; -1.314123e+02 ; 5.930585e+02 ];
omc_error_1 = [ 4.221795e-03 ; 2.918258e-03 ; 6.505325e-03 ];
Tc_error_1  = [ 2.505323e-01 ; 2.231496e-01 ; 1.855090e+00 ];

%-- Image #2:
omc_2 = [ -2.265407e+00 ; -2.112396e+00 ; 4.175850e-01 ];
Tc_2  = [ 1.673494e+01 ; -1.499138e+02 ; 5.213693e+02 ];
omc_error_2 = [ 4.303614e-03 ; 4.775711e-03 ; 7.711202e-03 ];
Tc_error_2  = [ 2.366269e-01 ; 1.638927e-01 ; 1.766564e+00 ];

%-- Image #3:
omc_3 = [ -2.090852e+00 ; -1.808924e+00 ; 1.005063e+00 ];
Tc_3  = [ -2.983436e+01 ; -1.345659e+02 ; 5.823405e+02 ];
omc_error_3 = [ 2.585939e-03 ; 2.419954e-03 ; 3.263671e-03 ];
Tc_error_3  = [ 2.172180e-01 ; 2.159056e-01 ; 1.644583e+00 ];

%-- Image #4:
omc_4 = [ 1.691729e+00 ; 1.845860e+00 ; 1.819238e-01 ];
Tc_4  = [ -4.275678e+01 ; -1.744109e+02 ; 4.806120e+02 ];
omc_error_4 = [ 1.776681e-03 ; 1.620579e-03 ; 3.600286e-03 ];
Tc_error_4  = [ 1.666281e-01 ; 1.281904e-01 ; 1.785220e+00 ];

%-- Image #5:
omc_5 = [ 1.644660e+00 ; 1.715391e+00 ; -1.277419e+00 ];
Tc_5  = [ -2.115284e+01 ; -9.796258e+01 ; 6.220054e+02 ];
omc_error_5 = [ 1.601669e-03 ; 1.471519e-03 ; 1.917004e-03 ];
Tc_error_5  = [ 1.918529e-01 ; 2.630931e-01 ; 1.552330e+00 ];

%-- Image #6:
omc_6 = [ -1.940236e+00 ; -1.684727e+00 ; -4.637671e-01 ];
Tc_6  = [ -4.666473e+01 ; -2.249079e+01 ; 3.701160e+02 ];
omc_error_6 = [ 1.669143e-03 ; 1.704621e-03 ; 2.945972e-03 ];
Tc_error_6  = [ 1.281476e-01 ; 1.472523e-01 ; 1.296669e+00 ];

%-- Image #7:
omc_7 = [ -2.588952e+00 ; -6.257485e-01 ; -1.551888e+00 ];
Tc_7  = [ -8.438953e+01 ; 1.220274e+02 ; 3.386373e+02 ];
omc_error_7 = [ 1.710056e-03 ; 1.340455e-03 ; 2.195905e-03 ];
Tc_error_7  = [ 2.158505e-01 ; 1.509063e-01 ; 1.539559e+00 ];

%-- Image #8:
omc_8 = [ -4.265877e-01 ; -2.051764e+00 ; 8.152402e-02 ];
Tc_8  = [ 5.980744e+01 ; -6.842644e+01 ; 3.548088e+02 ];
omc_error_8 = [ 1.002694e-03 ; 1.505364e-03 ; 2.073775e-03 ];
Tc_error_8  = [ 2.125477e-01 ; 1.155492e-01 ; 1.342812e+00 ];

%-- Image #9:
omc_9 = [ -1.776071e+00 ; -1.570735e+00 ; -4.174583e-01 ];
Tc_9  = [ -4.834298e+01 ; -8.723050e+01 ; 3.794353e+02 ];
omc_error_9 = [ 1.646652e-03 ; 1.592377e-03 ; 2.609857e-03 ];
Tc_error_9  = [ 1.280197e-01 ; 2.151250e-01 ; 1.321145e+00 ];

%-- Image #10:
omc_10 = [ 1.938151e+00 ; 1.958484e+00 ; -1.588230e-01 ];
Tc_10  = [ 5.050918e+01 ; -4.986681e+01 ; 8.050632e+02 ];
omc_error_10 = [ 4.816538e-03 ; 3.356723e-03 ; 8.187744e-03 ];
Tc_error_10  = [ 3.269981e-01 ; 2.709646e-01 ; 2.933049e+00 ];

%-- Image #11:
omc_11 = [ 2.519582e+00 ; 1.735582e+00 ; 2.597073e-01 ];
Tc_11  = [ -4.775993e+01 ; -5.539230e+01 ; 6.804623e+02 ];
omc_error_11 = [ 6.330482e-03 ; 3.994001e-03 ; 1.068897e-02 ];
Tc_error_11  = [ 2.149534e-01 ; 2.712309e-01 ; 3.053898e+00 ];

