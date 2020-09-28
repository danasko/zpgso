function out = saltpepper(I, salt, pepper)
out = I;
X = norminv([pepper 1-salt],0,1);
M = randn(size(I));
out(M<X(1)) = 0;
out(M>X(2)) = 255;
end