function [C,lambda,P] = get_pixel_ortho(R,XW,T,sx,sy,c0,r0,Ns,f)

  W = [sx 0 c0; 0 sy r0; 0 0 1];
  M = [R(1:2,:) T(1:2,:); 0 0 0 1];
    
    lambda = 0;
    
    for j = 1:Ns
    xc = (R * XW(:,j) ) + T;
    lambda = lambda + xc(3);
    u = xc(1);
    v = xc(2);
    C(:,j) = [sx 0 c0; 0 sy r0; 0 0 1] * [u;v;1];
    end
    lambda = lambda / Ns;
    
    C = round(C);
    P = W * M;

end