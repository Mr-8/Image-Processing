function [u,w] = BSRBGS(u0,w0,u1,w1,lambda_u,lambda_w,mu,n)
%% C_NW = [lambda_u + 2mu        mu          mu]
%%        [    mu         lambda_w + 2mu      0]   
%%        [    mu         0      lambda_w + 2mu]


R = [-mu,0,0;-mu,-mu,0;0,0,-mu];
U = [-mu,0,-mu;0,-mu,0;0, 0, -mu];
C0  = [lambda_u+4*mu, mu, mu;mu, lambda_w+4*mu,0;mu,0,lambda_w + 4*mu];
CNW = [lambda_u+2*mu, mu, mu;mu, lambda_w+2*mu,0;mu,0,lambda_w + 2*mu];
CN  = [lambda_u+3*mu, mu, mu;mu, lambda_w+3*mu,0;mu,0,lambda_w + 3*mu];
CNE  = [lambda_u+2*mu, 0, mu; 0, lambda_w+2*mu,0;mu,0,lambda_w + 2*mu];
CW  = [lambda_u+3*mu, mu, mu;mu, lambda_w+3*mu,0;mu,0,lambda_w + 3*mu];
CE  = [lambda_u+3*mu,  0, mu; 0, lambda_w+3*mu,0;mu,0,lambda_w + 3*mu];
CSW = [lambda_u+2*mu, mu,  0;mu, lambda_w+2*mu,0; 0,0,lambda_w + 2*mu];
CS  = [lambda_u+3*mu, mu,  0;mu, lambda_w+3*mu,0; 0,0,lambda_w + 3*mu];
CSE = [lambda_u+2*mu, 0, 0,; 0, lambda_w + 2*mu, 0; 0, 0, lambda_w + 2*mu];
x(:,:,1) = u0;
x(:,:,2) = w0(:,:,1);
x(:,:,3) = w0(:,:,2);
b(:,:,1) = u1;
b(:,:,2) = w1(:,:,1);
b(:,:,3) = w1(:,:,2);
[size1,size2] = size(u0);
for i = 1:n
   for j=1:size1
       for k = 1:size2 %% mod(j+k) == 1 red,  else black
           if mod(j+k,2) == 1
            if j==1 
               if k==1
                  x(j,k,:) = CNW\(reshape(b(j,k,:),[3,1]) - R*reshape(x(j+1,k,:),[3,1]) - U'*reshape(x(j,k+1,:),[3,1]));
                   
                   
               elseif k == size2
                  x(j,k,:) = CNE\(reshape(b(j,k,:),[3,1]) - R*reshape(x(j+1,k,:),[3,1]) - U*reshape(x(j,k-1,:),[3,1])); 
               else
                  x(j,k,:) = CN\(reshape(b(j,k,:),[3,1]) - R*reshape(x(j+1,k,:),[3,1])- U*reshape(x(j,k-1,:),[3,1]) - U'*reshape(x(j,k+1,:),[3,1]));
               end
               
           elseif j== size1
               if k == 1
                   x(j,k,:) = CSW\(reshape(b(j,k,:),[3,1]) - R'*reshape(x(j-1,k,:),[3,1]) - U'*reshape(x(j,k+1,:),[3,1]));
               elseif k == size2
                   x(j,k,:) = CSE\(reshape(b(j,k,:),[3,1]) - R'*reshape(x(j-1,k,:),[3,1]) - U*reshape(x(j,k-1,:),[3,1])); 
                   
               else 
                   x(j,k,:) = CS\(reshape(b(j,k,:),[3,1]) - R'*reshape(x(j-1,k,:),[3,1]) - U'*reshape(x(j,k+1,:),[3,1]) - U*reshape(x(j,k-1,:),[3,1]));
               end
               
           else
               if k == 1
                   x(j,k,:) = CW\(reshape(b(j,k,:),[3,1]) - R*reshape(x(j+1,k,:),[3,1]) - R'*reshape(x(j-1,k,:),[3,1]) - U'*reshape(x(j,k+1,:),[3,1]));
               elseif k == size2
                   x(j,k,:) = CE\(reshape(b(j,k,:),[3,1]) - R*reshape(x(j+1,k,:),[3,1]) - R'*reshape(x(j-1,k,:),[3,1]) - U*reshape(x(j,k-1,:),[3,1]));
               else
                   x(j,k,:) = C0\(reshape(b(j,k,:),[3,1]) - R*reshape(x(j+1,k,:),[3,1]) - R'*reshape(x(j-1,k,:),[3,1]) - U*reshape(x(j,k-1,:),[3,1]) - U'*reshape(x(j,k+1,:),[3,1]));
               end
               
               
           end
               
               
               
               
               
           end
           
           
       end
   end
   
   for j=1:size1
        for k = 1:size2 %% mod(j+k) == 1 red,  else black
           if mod(j+k,2) == 0
            if j==1 
               if k==1
                  x(j,k,:) = CNW\(reshape(b(j,k,:),[3,1]) - R*reshape(x(j+1,k,:),[3,1]) - U'*reshape(x(j,k+1,:),[3,1]));
                   
                   
               elseif k == size2
                  x(j,k,:) = CNE\(reshape(b(j,k,:),[3,1]) - R*reshape(x(j+1,k,:),[3,1]) - U*reshape(x(j,k-1,:),[3,1])); 
               else
                  x(j,k,:) = CN\(reshape(b(j,k,:),[3,1]) - R*reshape(x(j+1,k,:),[3,1])- U*reshape(x(j,k-1,:),[3,1]) - U'*reshape(x(j,k+1,:),[3,1]));
               end
               
           elseif j== size1
               if k == 1
                   x(j,k,:) = CSW\(reshape(b(j,k,:),[3,1]) - R'*reshape(x(j-1,k,:),[3,1]) - U'*reshape(x(j,k+1,:),[3,1]));
               elseif k == size2
                   x(j,k,:) = CSE\(reshape(b(j,k,:),[3,1]) - R'*reshape(x(j-1,k,:),[3,1]) - U*reshape(x(j,k-1,:),[3,1])); 
                   
               else 
                   x(j,k,:) = CS\(reshape(b(j,k,:),[3,1]) - R'*reshape(x(j-1,k,:),[3,1]) - U'*reshape(x(j,k+1,:),[3,1]) - U*reshape(x(j,k-1,:),[3,1]));
               end
               
           else
               if k == 1
                   x(j,k,:) = CW\(reshape(b(j,k,:),[3,1]) - R*reshape(x(j+1,k,:),[3,1]) - R'*reshape(x(j-1,k,:),[3,1]) - U'*reshape(x(j,k+1,:),[3,1]));
               elseif k == size2
                   x(j,k,:) = CE\(reshape(b(j,k,:),[3,1]) - R*reshape(x(j+1,k,:),[3,1]) - R'*reshape(x(j-1,k,:),[3,1]) - U*reshape(x(j,k-1,:),[3,1]));
               else
                   x(j,k,:) = C0\(reshape(b(j,k,:),[3,1]) - R*reshape(x(j+1,k,:),[3,1]) - R'*reshape(x(j-1,k,:),[3,1]) - U*reshape(x(j,k-1,:),[3,1]) - U'*reshape(x(j,k+1,:),[3,1]));
               end
               
               
           end
               
               
               
               
               
           end
           
           
       end
   end
    
    
    
end

for j=1:size1
       for k = 1:size2 %% mod(j+k) == 1 red,  else black
           if mod(j+k,2) == 1
            if j==1 
               if k==1
                  x(j,k,:) = CNW\(reshape(b(j,k,:),[3,1]) - R*reshape(x(j+1,k,:),[3,1]) - U'*reshape(x(j,k+1,:),[3,1]));
                   
                   
               elseif k == size2
                  x(j,k,:) = CNE\(reshape(b(j,k,:),[3,1]) - R*reshape(x(j+1,k,:),[3,1]) - U*reshape(x(j,k-1,:),[3,1])); 
               else
                  x(j,k,:) = CN\(reshape(b(j,k,:),[3,1]) - R*reshape(x(j+1,k,:),[3,1])- U*reshape(x(j,k-1,:),[3,1]) - U'*reshape(x(j,k+1,:),[3,1]));
               end
               
           elseif j== size1
               if k == 1
                   x(j,k,:) = CSW\(reshape(b(j,k,:),[3,1]) - R'*reshape(x(j-1,k,:),[3,1]) - U'*reshape(x(j,k+1,:),[3,1]));
               elseif k == size2
                   x(j,k,:) = CSE\(reshape(b(j,k,:),[3,1]) - R'*reshape(x(j-1,k,:),[3,1]) - U*reshape(x(j,k-1,:),[3,1])); 
                   
               else 
                   x(j,k,:) = CS\(reshape(b(j,k,:),[3,1]) - R'*reshape(x(j-1,k,:),[3,1]) - U'*reshape(x(j,k+1,:),[3,1]) - U*reshape(x(j,k-1,:),[3,1]));
               end
               
           else
               if k == 1
                   x(j,k,:) = CW\(reshape(b(j,k,:),[3,1]) - R*reshape(x(j+1,k,:),[3,1]) - R'*reshape(x(j-1,k,:),[3,1]) - U'*reshape(x(j,k+1,:),[3,1]));
               elseif k == size2
                   x(j,k,:) = CE\(reshape(b(j,k,:),[3,1]) - R*reshape(x(j+1,k,:),[3,1]) - R'*reshape(x(j-1,k,:),[3,1]) - U*reshape(x(j,k-1,:),[3,1]));
               else
                   x(j,k,:) = C0\(reshape(b(j,k,:),[3,1]) - R*reshape(x(j+1,k,:),[3,1]) - R'*reshape(x(j-1,k,:),[3,1]) - U*reshape(x(j,k-1,:),[3,1]) - U'*reshape(x(j,k+1,:),[3,1]));
               end
               
               
           end
               
               
               
               
               
           end
           
           
       end
end

u = x(:,:,1);
w(:,:,1) = x(:,:,2);
w(:,:,2) = x(:,:,3);


end