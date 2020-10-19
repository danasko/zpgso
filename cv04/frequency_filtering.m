% frequency filtering 

J = imread('stripes.png');
##J = imread('stripes_vertical.jpg');
imshow(J);
figure;
if size(J,3) == 3
    J = rgb2gray(J);
end
J = im2double(J);
ft = fft2(J);
imagesc(abs(fftshift(ft)));