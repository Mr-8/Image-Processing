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
addpath Solver
addpath './result';
addpath './Solver';
addpath './special function';
addpath './differential operator';
%% TGV origional paper
%% 
%% 


kernel_size = 15;
gaussian_sigma = 1;

%% parameter
para.noisesigma = 0.05; %% noise level
para.sigma = 0.05;
para.k = 2;  %% TGV order
para.subtoler = 1e-4;
para.eta = 0.05;
para.maxIter = 500;
para.alpha0 = 0.1;
para.alpha1 = 0.05;
para.tau = 0.02;

%% Initial picture and noise
f = im2double(imread('peppers256.png'));
[para.size1,para.size2] = size(f);
ker = fspecial('gaussian',[kernel_size,kernel_size],gaussian_sigma);
noised = f + para.noisesigma*randn(para.size1,para.size2);


%% Solver 
u =  TGVSolver(noised,para);

% u = PreDouglasL1(noised,para);

% u = PreDouglasL2(noised,para);

% u = SemiNewton(noised,para);

%%
subplot(1,3,1);
imshow(f);
subplot(1,3,2)
imshow(noised);
subplot(1,3,3)
imshow(u);