function i = get_closest_ind(XN,XW)
X = sum(bsxfun(@pow,bsxfun(@minus,XW,XN),2));
[~,i] = min(X);
end