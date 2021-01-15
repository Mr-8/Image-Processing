function u = Threshold(Du, alpha,type)
    if type == 1 %% gradient threshold
        %norm_u = sum(sum(sqrt(Du(:,:,1).^2 + Du(:,:,2).^2 + 2*Du(:,:,3).^2)));
        u(:,:,1) = max(abs(Du(:,:,1)) - alpha,0).*sign(Du(:,:,1));
        u(:,:,2) = max(abs(Du(:,:,2)) - alpha,0).*sign(Du(:,:,2));
    else %% Hessian threshold
        %norm_u = sum(sum(sqrt(Du(:,:,1).^2 + Du(:,:,2).^2)));
        u(:,:,1) = max(abs(Du(:,:,1)) - alpha,0).*sign(Du(:,:,1));
        u(:,:,2) = max(abs(Du(:,:,2)) - alpha,0).*sign(Du(:,:,2));
        u(:,:,3) = max(abs(Du(:,:,3)) - alpha,0).*sign(Du(:,:,3));
    end


end


