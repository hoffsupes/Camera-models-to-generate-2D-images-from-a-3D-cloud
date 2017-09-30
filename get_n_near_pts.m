function pts = get_n_near_pts(mm,ll, i,j,n)

ll(:,1) = ll(:,1) - i;
ll(:,2) = ll(:,2) - j;

ll = ll.^2;
ll = sum(ll,2);

[vals,idx] = sort(ll,'ascend');
idx = idx(1:n);
pts = mm(idx);
pts = mean(pts(:));

end