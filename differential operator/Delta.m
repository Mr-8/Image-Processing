function delta_u = Delta(u,type1,type2)
%% Discrete Forward & Backward difference operator
%% TGV method
%% Input: u, matrix, image
%%        type1: integer, 1 = x direction, 2 = y direction
%%        type2: integer, 1 = forward difference, 2 = backward difference
%%
%% Output: delta_u, matrix, x/y direvative of image u
%%       
%% Coder: Rubing Han
%% Lastest Version: 2021/1/15
    if type1 == 1 %% x-derivative
        if type2 == 1 %% forward difference 
            delta_u = [u(:,2:end) - u(:,1:end-1),u(:,end)-u(:,end)];
        else %% backward difference
            delta_u = [u(:,1),u(:,2:end-1) - u(:,1:end-2),-u(:,end)];
        end
    else %% y-derivative
       if type2 == 1 % forward difference 
           delta_u = [u(2:end,:) - u(1:end-1,:);u(end,:)-u(end,:)];
           
       else %% Backward difference 
           delta_u = [u(1,:);u(2:end-1,:) - u(1:end-2,:);-u(end,:)];
       end
        
    end



end