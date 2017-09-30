function [Il] = get_intensity(N,L,b,d,p,f,alpha)

cnst = (d/f)^2 * (((b * p * pi )/ 4) * (cos(alpha))^4);
Il = cnst * sum(bsxfun(@times,L,N)',2);

Il(Il<0) = 0;

Il = (Il - min(Il)) / (max(Il) - min(Il));
Il  = (Il * 255);
Il = uint8(Il);

end