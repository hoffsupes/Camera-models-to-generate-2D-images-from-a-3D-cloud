function CNN = get_image_new(Il,C, Ij, J, K,str,CNN)

for j = 1: size(C,2)
CNN(C(2,j),C(1,j)) = Il(j);    
end
CNN = uint8(CNN);
figure;
imshow(CNN);
title(sprintf('%s R%d L%d F%d',str,Ij,J,K));

end