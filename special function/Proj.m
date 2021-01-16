function PD2u = Proj(D2u,para)
%% Projection to the constriant domain K_h
%% INPUT: u, matrix 
%% OUTPUT: v, matrix 
%% 
%% Coder: Rubing Han
%% Latest Version
%% Initialization
eta_k = div(D2u,2);
bareta_k = eta_k;
error = 1;
PD2u = 0;
t_k = 1;
while error >= para.subtoler
    temp2 = PD2u;
    temp = eta_k;
    q_k = Threshold(D2u + grad(bareta_k,1),para.alpha0,2);
    eta_k = Threshold(eta_k + para.sigma*div(D2u + grad(bareta_k,1) - q_k,2),para.sigma*para.alpha1,1);
    t_k = (1+sqrt(1+4*t_k^2))/2;
    bareta_k = eta_k + (t_k -1)*(eta_k - temp)/(t_k+1);
    PD2u = D2u - q_k + grad(eta_k,1);
    error = norm_u(PD2u - temp2) / norm_u(D2u);
end
    
    

end