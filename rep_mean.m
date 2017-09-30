function I = rep_mean(I)

if(I(size(I,1) - floor(size(I,1)/2),size(I,2) - floor(size(I,2)/2) ) == 0)
I(size(I,1) - floor(size(I,1)/2),size(I,2) - floor(size(I,2)/2)) = mean(I(:));
end

end