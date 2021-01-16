function D2u = grad(Du,type)
%% Input

%% Output
%% Coder:Rubing Han
%% Lastest Version:2021/1/15

if type == 0
    D2u(:,:,1) = Delta(Du,1,1);
    D2u(:,:,2) = Delta(Du,2,1);
    
else  % type == 1 
    D2u(:,:,1) = Delta(Du(:,:,1),1,1);
    D2u(:,:,2) = Delta(Du(:,:,2),2,1);
    D2u(:,:,3) = (Delta(Du(:,:,1),2,1) + Delta(Du(:,:,2),1,1)) / 2;
end

end