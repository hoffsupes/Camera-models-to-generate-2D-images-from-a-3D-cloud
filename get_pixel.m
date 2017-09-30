function [C,lambda,P] = get_pixel(R,XW,T,sx,sy,c0,r0,Ns,f)

  W1 = [f 0 0; 0 f 0; 0 0 1];
  W2 = [sx 0 c0; 0 sy r0; 0 0 1];
  M = [R T];
    
    for j = 1:Ns
    xc = (R * XW(:,j) ) + T;
    u = (f * xc(1)) / xc(3);
    v = (f * xc(2)) / xc(3);
    lambda(j) = xc(3);
    C(:,j) = [sx 0 c0; 0 sy r0; 0 0 1] * [u;v;1];
    end
    
    C = round(C);
    P = W2 * W1 * M;
end