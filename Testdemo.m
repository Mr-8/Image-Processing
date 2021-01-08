%% This file is a test demo for the Project of Image Processing
%% To do List
%% TGV: different solver 
%%      1. Origional Paper 4
%%      2. Semismooth Newton's method 
%% Manifold TGV:Implement
%%      1. 2D case
%%      2. 3D case
clear all;
clc;

addpath './result';

%% TGV origional paper
%% 
%% 


kernel_size = 15;
gaussian_sigma = 1;

%% parameter
para.sigma = 0.01; %% noise level
para.k = 2;  %% TGV order


%% Initial picture and noise
f = im2double(imread('lena.png'));
para.size = size(f);
ker = fspecial('gaussian',[kernel_size,kernel_size],gaussian_sigma);
f = f + para.sigma*randn(para.size);


%% Solver 
u =  TGVSolver(f,para);

%%