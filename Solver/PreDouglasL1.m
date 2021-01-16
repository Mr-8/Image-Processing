function u = PreDouglasL1(f,para)
%% Preconditioned Douglas-Rachford iteration for L^1- TGV denoising 
%% min || u-f ||_1 + TGV^2(u)
%% Input: f, matrix, noised picture
%%        para,structure, parameter set
%% Output: u, matrix, denoised picture

%% Initialization
u_k = f;
baru_k = f;
barq_k = sym_grad(f,para);
w_k = div(barq_k,2);
barp_k = w_k;

para.sigma = 0.01;
para.tau = 0.005;
para.InnerIter = 500;
iter = 0;

while iter < para.InnerIter
    iter = iter +1;
    bu_k = para.sigma*(f + div(barp_k,1));
    bw_k = para.sigma*((barp_k + div(barq_k,2)));
    [u_k,w_k] = BSRBGS(u_k,w_k,bu_k,bw_k,para.sigma,para.sigma^2,para.sigma^2,para.InnerIter);
    p_k = barp_k + para.sigma*(grad(u_k,0) -w_k);
    q_k = barq_k + para.sigma*(grad(w_k,1));
    p_test = P(2*p_k - barp_k,para.alpha1,1);
    barp_k = barp_k + p_test - p_k;
    q_test = P(2*q_k - barq_k,para.alpha0,2);
    barq_k = barq_k + q_test - q_k;
    
end









end