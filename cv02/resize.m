function J = resize(I, RJ, CJ)
J = zeros(RJ,CJ,'uint8');
[row, col] = size(I);
Sr = row/RJ; Sc = col/CJ;
for r = 1:RJ
    for c = 1:CJ
        rf = r*Sr; cf = c*Sc;
        rf = floor(rf); cf =floor(cf);
        if rf<1,rf=1; end
        if cf<1, cf=1; end
        J(r,c) = I(rf,cf);
    end
end
end