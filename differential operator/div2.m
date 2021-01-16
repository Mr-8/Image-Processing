function u = div2(D2u)
%% u = div(div(D2u)), making Tensor to a scalar
%% Input: D2u, 3D array, D2u(:,:,1) = xx derivative
%%                        D2u(:,;,2) = yy derivative 
%%                        D2u(:,:,3) = symmetrix xy derivative
%% Output: u, matrix, div(div(D2u))
%% Coder: Rubing Han
%% Lastest Version: 2021/1/15


u = Delta(Delta(D2u(:,:,1),1,1),1,0) + Delta(Delta(D2u(:,:,2),2,1),2,0) + ...
    Delta(Delta(D2u(:,:,3),1,1),2,0) + Delta(Delta(D2u(:,:,3),2,1),1,0);



end