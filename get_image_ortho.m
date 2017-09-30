function Iz = get_image_ortho(Il,C, Ij, J, K,str,nbd,pts,V)

I = uint8(zeros(500,500));

for j = 1: size(C,2)
I(C(2,j),C(1,j)) = Il(j);    
end

I = preprocess_I_2(I,nbd,pts,V);

[II,JJ,vals] = find(I);
CN = [JJ,II,ones(length(II),1)]';
CN = [4 0 0; 0 4 0; 0 0 1] * CN;

Iz = uint8(zeros(2000,2000));

for j = 1:size(CN,2)
Iz(CN(2,j),CN(1,j)) = vals(j);    
end

Iz = preprocess_I_2(Iz,nbd,pts,V);

% imshow(Iz);
% title(sprintf(' %s R%d L%d F%d ',str,Ij,J,K));
% figure;
imwrite(Iz,sprintf('R/%s_R%d_L%d_F%d.jpeg',str,Ij,J,K));
fprintf('R/%s_R%d_L%d_F%d.jpeg\n',str,Ij,J,K);

end