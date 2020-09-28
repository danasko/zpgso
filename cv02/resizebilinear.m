function J = resizebilinear(I, RJ, CJ)
J = zeros(RJ,CJ,'uint8');
[row, col] = size(I);
Sr = row/RJ; Sc = col/CJ;
for rj = 1:RJ
    for cj = 1:CJ
        rf = rj*Sr; cf = cj*Sc;
        r = floor(rf); c =floor(cf);
        rd = rf - r; cd = cf - c;
        if r<1,r=1; end
        if c<1, c=1; end
        
        J(rj,cj) = I(r,c)*(1-rd)*(1-cd);
        if r<row
            J(rj,cj) = J(rj,cj) + I(r+1,c)*rd*(1-cd);
           if c<col
               J(rj,cj) = J(rj,cj) + I(r+1,c+1)*rd*cd;
           end
        end
        if c<col
            J(rj,cj) = J(rj,cj) + I(r,c+1)*(1-rd)*cd;
        end
    end
end
end