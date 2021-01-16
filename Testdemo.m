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
para.toler = 1e-4;
para.subtoler = 1e-4;
para.eta = 0.05;
para.maxIter = 500;
para.alpha0 = 0.1;
para.alpha1 = 0.05;
para.tau = 0.02;
para.InnerIter = 500;
%% Initial picture and noise
f = im2double(imread('peppers256.png'));
[para.size1,para.size2] = size(f);
ker = fspecial('gaussian',[kernel_size,kernel_size],gaussian_sigma);
noised = f + para.noisesigma*randn(para.size1,para.size2);


%% Solver 
u1 =  TGVSolver(noised,para);

u2 = PreDouglasL1(noised,para);

% u = PreDouglasL2(noised,para);

% u = SemiNewton(noised,para);

result.MSE_TGV = sum(sum((u1 - f).^2))/para.size1/para.size2;
result.PSNR_TGV = 10*log10(max(max(u1))^2/result.MSE_TGV);

result.MSE_PDL2 = sum(sum((u2 - f).^2))/para.size1/para.size2;
result.PSNR_PDL2 = 10*log10(max(max(u2))^2/result.MSE_PDL2);

result.MSE_Origin = sum(sum((noised -f).^2))/para.size1/para.size2;
result.PSNR_Origin = 10*log10(max(max(noised))^2/result.MSE_Origin);




%%
subplot(1,4,1);
set(gcf,'Position',[40,40,1600,200]);
imshow(f);
h = title('Origin');
set(h,'fontsize',20);

subplot(1,4,2)
imshow(noised);
h = title({'noised';['PSNR =',num2str(result.PSNR_Origin)]});
set(h,'fontsize',20);

subplot(1,4,3)
imshow(u1);
h = title({'TGV';['PSNR =',num2str(result.PSNR_TGV)]});
set(h,'fontsize',20);

subplot(1,4,4)
imshow(u2);
h = title({'PDL2';['PSNR =',num2str(result.PSNR_PDL2)]});
set(h,'fontsize',20);

saveas(gcf,'./result/result_TGV_peppers.png');
