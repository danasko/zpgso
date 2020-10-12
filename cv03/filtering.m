I = imread('coins.png');
Isum = imnoise(I, 'gaussian');
avg_filt = ones(5)/25;
Ifilt = imfilter(I, avg_filt);
gauss_filt = fspecial('gaussian', [5 5], .9);
Ifilt2 = imfilter(Isum, gauss_filt);
% J = imgaussfilt(I, sigma);

Isum2 = imnoise(I, 'salt & pepper');
Ifilt3 = medfilt2(Isum2);

