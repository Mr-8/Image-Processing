function u = TGVSolver(f,para)
%% TGV denoise solver 
%% INPUT: f, matrix,  noised picture
%%        para, structrue, parameter.

%% OUTPUT: u, matrix, clean picture
%% 

v_k = 0;
u_k = 0;
t_k = 1;

iter = 0;


while iter < para,maxIter
    
    temp = v_k;
    v_k = Proj(u_k + para.tau*sym_grad(f - div2(u_k)));
    t_k = 1+sqrt(1+4*t_k^2)/2;
    u_k = v_k + (t_k-1)*(v_k - temp)/(t_k + 1);
end


end