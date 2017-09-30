function lis = get_nearest_point(XW,XN)

lis = zeros(size(XN,2),1);

for i = 1:size(XN,2)

    [~,ind] = min(sum(bsxfun(@power,bsxfun(@minus,XW,XN(:,i)),2),2));
    lis(i) = ind;
    
end
l = 1;
end