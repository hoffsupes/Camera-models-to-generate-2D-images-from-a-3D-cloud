function [I,J,K] = get_indice(i)

if(i == 1)
I = 1; J =1; K= 1;
elseif (i == 2)
        I = 1; J =1; K= 2;

    elseif(i == 3)
            I = 1; J =2; K= 1;

        elseif(i == 4)
                I = 1; J =2; K= 2;
            elseif(i == 5)
                    I = 2; J =1; K= 1;
                else if (i == 6)
                        I = 2; J =1; K= 2;
                    elseif(i == 7)
                            I = 2; J =2; K= 1;
                        elseif(i == 8)
                                I = 2; J =2; K= 2;
                                
end

end