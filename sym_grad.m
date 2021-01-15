function D2u = sym_grad(u,para)
%% Symmetric gradient for u 
%% 
%% Input: u, matrix, image.
%%        para, structure, parameter set
%% Output: D2u, 3D array, D2u(:,:,1) = xx derivative
%%                        D2u(:,;,2) = yy derivative 
%%                        D2u(:,:,3) = symmetrix xy derivative
%% Coder: Rubing Han
%% Lasted Version: 2021/1/15

    D2u = zeros(para.size1,para.size2,3);
    D2u(:,:,1) = Delta(Delta(u,1,1),1,0);
    D2u(:,:,2) = Delta(Delta(u,2,1),2,0);
    D2u(:,:,3) = (Delta(Delta(u,1,1),2,0) + Delta(Delta(u,2,1),1,0))/2;

end