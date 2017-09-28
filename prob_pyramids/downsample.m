function new_im = downsample(im)
% Use this function to downsample the image by exactly a factor of 2.
%   Detailed explanation goes here
[rows,cols] = size(im);
new_im = zeros(rows/2,cols/2, 'single');
for row = 1:rows/2
    for col = 1:cols/2
        % %%% use this code for average-based downsampling % %%%
        summation = 0.0;
        summation = summation + im(2*row-1,2*col-1);    % top left
        summation = summation + im(2*row-1,2*col);      % top right
        summation = summation + im(2*row,2*col-1);      % bottom left
        summation = summation + im(2*row,2*col);        % bottom right
        average = summation / 4.0;
        new_im(row,col) = average;
        
        % %%% use this code for top left based downsampling %%% %
%         new_im(row,col) = im(2*row-1,2*col-1);  % only use the top left pixel
    end
end
end

