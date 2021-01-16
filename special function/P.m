function Pu = P(u,alpha,type)
%% This function is Projection in Douglas_Rachford
%% See formula (33) in paper 
%% Coder: Rubing Han
%% Latest Version: 2021/1/16



if type == 1 %% Projection in V
    norm_u = sqrt(u(:,:,1).^2 + u(:,:,2).^2);
    Pu(:,:,1) = u(:,:,1)./(max(1,norm_u/alpha));
    Pu(:,:,2) = u(:,:,2)./(max(1,norm_u/alpha));
else %% Projection in W
    norm_u = sqrt(u(:,:,1).^2 + u(:,:,2).^2 + 2*u(:,:,3).^2);
    Pu(:,:,1) = u(:,:,1)./(max(1,norm_u/alpha));
    Pu(:,:,2) = u(:,:,2)./(max(1,norm_u/alpha));
    Pu(:,:,3) = u(:,:,3)./(max(1,norm_u/alpha));
    
end


end