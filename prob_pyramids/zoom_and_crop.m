function im = zoom_and_crop( im )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

[h,w,d] = size(im);
delta = 10;
im = im( round(h/4)-delta:round(3*h/4) , round(w/4)+delta:round(3*w/4), 1:3 );  % 1-3 for all 3 color channels


end

