function new_im = downsample(im)
% Use this function to downsample the image by exactly a factor of 2.
%   Detailed explanation goes here
[rows,cols] = size(im);
new_im = zeros(rows/2,cols/2, 'single');
for row = 1:rows/2
    for col = 1:cols/2
        new_im(row,col) = im(2*row-1,2*col-1);
    end
end
end

