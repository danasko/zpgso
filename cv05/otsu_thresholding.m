function res = otsu_thresholding(I)
  if length(size(I))>2
    I = rgb2gray(I);
  end
  max_val = 0;
  T = 0;
  h = imhist(I)/numel(I);
  for t=1:254
    w0 = sum(h(1:t));
    w1 = 1 - w0;
    if w0>0 && w1>0
      m2 = dot([t+1:256],h(t+1:256))/w1;
      m1 = dot([1:t],h(1:t))/w0;
      
      val = w0 * w1 * ((m1-m2)^2);
      if val > max_val
        max_val = val;
        T = t;
      endif
      
    endif
  endfor
  res = I>=T;
  disp(T)
endfunction
