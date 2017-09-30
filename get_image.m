function I = get_image(Il,C, Ij, J, K,str)

% I = uint8(zeros(250,250));

for j = 1: size(C,2)
I(C(2,j),C(1,j)) = Il(j);    
end

% figure;
% imshow(I);
% % imshow(imresize(I,[1000,1000]));
% title(sprintf('%s R%d L%d F%d',str,Ij,J,K));

imwrite(I,sprintf('R/%s_R%d_L%d_F%d.jpeg',str,Ij,J,K));
fprintf('R/%s_R%d_L%d_F%d.jpeg\n',str,Ij,J,K);

end