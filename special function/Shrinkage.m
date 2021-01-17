function Su = Shrinkage(u,f,sigma)
%% Soft Thresholding for PreDouhglasL1 model
%% 
%% Input: u, matrix,
%%        f, matrix, noised picture.
%%       sigma, scalar, parameter
%% Output: Su, matrix, picture after thresholding.
%% Coder: Rubing Han
%% Latest Version: 2021/1/17

Su = f + sign(u-f).*max(0,abs(u-f) - sigma);


end