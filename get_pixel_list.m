function cnew = get_pixel_list(C)

[X,Y] = meshgrid(1:size(C,1),1:size(C,2));
cnew = [X(:) , Y(:),  ones(numel(Y),1)]';

end