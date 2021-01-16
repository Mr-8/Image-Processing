function u = TGVSolver(f,para)
%% TGV denoise solver 
%% INPUT: f, matrix,  noised picture
%%        para, structrue, parameter.
%% Variable: v_k,  
%%           t_k, scalar
%%           u_k,
%%
%% OUTPUT: u, matrix, clean picture
%% 

v_k = sym_grad(f,para);
u_k = v_k;
t_k = 1;
u = 0;
iter = 0;
% error = 1;

while (iter < para.maxIter) %&& (error > para.toler)
%     temp2 = u;
    iter = iter+1;
    temp = v_k;
    v_k = Proj(u_k + para.tau*sym_grad(f - div2(u_k),para),para);
    t_k = 1+sqrt(1+4*t_k^2)/2;
    u_k = v_k + (t_k-1)*(v_k - temp)/(t_k + 1);
    u = f - div2(v_k);
%     error = norm(u-temp2)/norm(f);
end
    
    
end