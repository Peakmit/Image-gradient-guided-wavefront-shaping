function [phase,obj] = initial_pra(pic,speckle_size)
%   initial_pra: Initializeing the parameters used in image gradient guided
%   wavefront shaping
%   Input:
%   pic: Target to be imaged
%   speckle_size: The number of pixels covered by one speckel grain
%   Output:
%   phase: Randomo phase screen
%   obj: Binary target

global N_pic; % The number of pixels on the camera
global N_phase; % The DoF(Degree of Freedom) of rand phase screen
global populations; % Population matrix in GA algorithm
global SNR; % Signal to noise ratio in the simulation
global ans_dim; % The DoF(Degree of Freedom) of the SLM(Spatial Light Modulator)
global operator_x; % The image gradient operator in x direction
global operator_y;% The image gradient operator in y direction

N_pic = 128;
N_phase = round(N_pic/speckle_size);
ans_dim = N_phase;
populations = [];
SNR = 100;

% Choose an operator to calculate the image gradient

% Roberts Operator
% operator_x = [-1 0; 0 1];
% Sobel Operator
% operator_x = [-1 0 1; -2 0 2; -1 0 1];
% Prewitt Operator
operator_x = [-1 0 1; -1 0 1; -1 0 1];
operator_y = operator_x';

% Image crop and Binarization
obj = zeros([N_pic,N_pic]);
I = pic(:,:,1);
I(I < 127) = 1;
I(I >= 127) = 0;
I = im2double(I);
[r, c] = size(I);
obj(1:r,1:c) = I;

% Genrate phase disturbance base on random phase screen model
random_phase = 2*pi*rand([N_phase,N_phase]);
phase = exp(1i*random_phase);

end

