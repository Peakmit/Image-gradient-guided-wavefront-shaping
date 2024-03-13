%% Initialization
clc,clear;
% Parameters
global N_pic;
global N_phase;
global populations;
global ans_dim;
addpath('.\Functions\');

pic = imread('./source/nudt.png'); 
speckle_size = 4;
[phase_disturb,obj] = initial_pra(pic,speckle_size);
X = zeros(ans_dim,ans_dim);
% [old,psf_old] = show_pic(obj,phase_disturb,zeros(ans_dim,ans_dim));
% [org,psf_org] = show_pic(obj,ones([N_phase N_phase]),zeros(ans_dim,ans_dim));

%% Optimizing
options = optimoptions('ga',"Display","iter",'FunctionTolerance',0.001,...
    "InitialPopulationMatrix",populations,"MutationFcn",'mutationuniform',...
    "MaxStallGenerations",100,"PopulationSize",50,...
    'SelectionFcn',@selectionroulette );
[X,score,~,~,populations,~] = ga(@(correct) Image_metric(reshape(correct,ans_dim,ans_dim),phase_disturb,obj),...
ans_dim^2, [], [], [], [], -2*pi*ones([1,ans_dim^2]), zeros([1,ans_dim^2]),[],options);
% [out,psf] = show_pic(obj,other_phase,X,roi);

%% 展示图像
[out,psf] = show_pic(obj,phase_disturb,X); 

