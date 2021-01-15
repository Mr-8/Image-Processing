function D2u = grad(Du)
%% Input

%% Output
%% Coder:Rubing Han
%% Lastest Version:2021/1/15

D2u(:,:,1) = Delta(Du(:,:,1),1,0);
D2u(:,:,2) = Delta(Du(:,:,2),2,0);
D2u(:,:,3) = (Delta(Du(:,:,1),2,0) + Delta(Du(:,:,2),1,0)) / 2;

end