function I = preprocess_I_2(I,k,nn,V)

if mod(k,2) == 0
    
l = round(k/2);
u = l+1;

else

l = round(k/2);
u = l;

    
end
% In = imclose(imdilate(edge(I),strel(ones(10,10))),strel(ones(10,10)));
In = imdilate(edge(I),strel('sphere',V));
In = imfill(medfilt2(In - imopen(In - (I~=0),strel('sphere',4)),[5 5]));

for i = 1:size(I,1)
    for j = 1:size(I,2)
   
        if(In(i,j) ~= 0 && I(i,j) == 0)
        n = 0;
        s = 0;
        mm = [];
        ll = [];
            for ii = i-u:i+l
                for jj = j-u:j+l
                    
                    if(ii > size(I,1) || jj > size(I,2))
                    continue;
                    end
                    
                    if(I(ii,jj) ~= 0)
                        mm(n+1) = I(ii,jj);
                        ll(n+1,1) = ii;
                        ll(n+1,2) = jj;
                        s = s + double(I(ii,jj));
                        n = n + 1;
                    end
                    
                end
            end
            
            if( size(mm,2) > 3)
            
                I(i,j) = round(get_n_near_pts(mm,ll, i,j,nn));
%                 mmm = max(mm(:));
            
            else
            
%             if(size(mmm,1) ~= 0)
%             I(i,j) = mmm;
%             end     
            I(i,j) = round(s/n);
            
            end
        end
        
    end
end


end