function [output] = gaussianNoise(I, sigma)
I = im2double(I);
output = I + sigma*randn(size(I));
% output = im2uint8(output);
end