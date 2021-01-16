function norm  = norm_u(Du)
    norm = sum(sum(sqrt(Du(:,:,1).^2 + Du(:,:,2).^2 + 2*Du(:,:,3).^2)));

end