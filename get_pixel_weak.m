function [C,P] = get_pixel_weak(R,XW,T,sx,sy,c0,r0,Ns,f,lambda)

  W1 = [f 0 0; 0 f 0; 0 0 1];
  W2 = [sx 0 c0; 0 sy r0; 0 0 1];
  M = [R T];
    
    for j = 1:Ns
    xc = (R * XW(:,j) ) + T;
    u = (f*xc(1)) / lambda ;
    v = (f*xc(2)) / lambda ;
    C(:,j) = [sx 0 c0; 0 sy r0; 0 0 1] * [u;v;1];
    end
    
    
    C = round(C);
    
    P = W2 * (1/lambda) * W1 * M;

    
end