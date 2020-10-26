function res = global_thresholding(I)
  if length(size(I))>2
    I = rgb2gray(I);
  end
  h = imhist(I);
  t = mean(I(:));
##  t = floor(dot(1:256, h)/(numel(I)));
  delta = t;
  epsilon = 10e-1;
  while (delta >= epsilon)
    G1 = I(I<t);
    G2 = I(I>=t);
    m1 = mean(G1(:));
    m2 = mean(G2(:));

##    m1 = dot([1:t],h(1:t))/(sum(h(1:t)));
##    m2 = dot([t+1:256],h(t+1:256))/(sum(h(t+1:256)));

    delta = abs(floor((m1+m2)/2) - t);
    t = floor((m1+m2)/2);
  end
res = I>=t;
disp(t)
endfunction
