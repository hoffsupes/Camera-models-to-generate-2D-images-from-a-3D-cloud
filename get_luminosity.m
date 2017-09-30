function [Il] = get_intensity(N,L,b,d,p,f,alpha)

cnst = (d/f)^2 * (((b * p * pi )/ 4) * (cos(alpha))^4);
Il = bsxfun(@times, cnst,bsxfun(@times,L,N));


end