function u = PreDouglasL2(f,para)
%% Preconditioned Douglas-Rachford iteration for L^1- TGV denoising 
%% min || u-f ||_1 + TGV^2(u)
%% Input: f, matrix, noised picture
%%        para,structure, parameter set
%% Output: u, matrix, denoised picture
%% Coder: Rubing Han
%% Latest Version: 2021/1/17
%% Initialization
u_k = f;
baru_k = f;
barq_k = sym_grad(f,para);
w_k = div(barq_k,2);
barp_k = w_k;

iter = 0;
error = 1;
while iter < para.InnerIter && error > para.toler
    temp = u_k;
    iter = iter +1;
    bu_k = baru_k + para.tau*para.sigma*div_op(barp_k,1);
    bw_k = w_k + para.tau*para.sigma*((barp_k + div(barq_k,2))+ para.tau*para.sigma*(grad(div(w_k,1),0) - div_op(grad_op(w_k,1),2))/2);
    [u_k,w_k] = BSRBGS(u_k,w_k,bu_k,bw_k,1,1+ (para.tau*para.sigma)^2,(para.tau*para.sigma)^2,para.InnerIter);
    p_k = barp_k + para.tau*para.sigma*(grad_op(u_k,0) -w_k);
    q_k = barq_k + para.tau*para.sigma*(grad_op(w_k,1));
    u_test = Shrinkage(2*u_k - baru_k,f,para.sigma);
    baru_k = baru_k + u_test - u_k;
    p_test = P(2*p_k - barp_k,para.alpha1/para.tau,1);
    barp_k = barp_k + p_test - p_k;
    q_test = P(2*q_k - barq_k,para.alpha0/para.tau,2);
    barq_k = barq_k + q_test - q_k;
    error = norm(u_k - temp)/norm(temp);
end
    u = u_k;



end