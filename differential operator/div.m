function Du = div(D2u,type)
%% div : D2u \to laplace Du
%% Input: D2u, Tensor 
%% Output: Du, gradient type Du = laplace(Du)

%% Coder: Rubing Han
%% Lastest Version: 2021/1/15

if type ==1
   Du = Delta(D2u(:,:,1),1,1) + Delta(D2u(:,:,2),2,1); 
    
else
Du(:,:,1) = Delta(D2u(:,:,1),1,1) + Delta(D2u(:,:,3),2,1);
Du(:,:,2) = Delta(D2u(:,:,3),1,1) + Delta(D2u(:,:,2),2,1);

end

end