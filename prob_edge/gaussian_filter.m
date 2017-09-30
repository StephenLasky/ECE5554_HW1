function im = gaussian_filter( im, sigma )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

f_rad = ceil(3 * sigma);            % compute the radius of the filter
f_width = 1 + 2 * f_rad;            % we assume this is an odd number
f_size = f_width*f_width;

% construct the filter 
filter = ones(f_width,f_width,'single');
[rows,cols] = size(filter);
for row = 1:rows
    for col = 1:cols
        y = (f_rad+1) - row;
        x = col - (f_rad+1);
        G = exp(-(x^2+y^2)/(2*sigma^2));
        filter(row,col) = G;
    end
end
filter = 1/(2*pi*sigma^2) * filter;
f_sum = sum(sum(filter));        % should be equal to 1
filter = (1/f_sum) * filter ;    % use this to correct the filter so that it sums to one

% create matrix where the new image will be stored
[rows,cols] = size(im);
new_im = zeros(rows + 2*f_rad,cols + 2*f_rad, 'single');

% pad the original image with zeros
im = padarray(im,[f_rad f_rad],0,'both');
% now, replace those zeroes to achieve the "mirror?" effect
% start with the rows
for row = 1:f_rad
    im(row,f_rad+1:cols+f_rad) = im(f_rad+1,f_rad+1:cols+f_rad);
end
for row = f_rad+rows:2*f_rad+rows-1
    im(row,f_rad+1:cols+f_rad) = im(f_rad+rows-1,f_rad+1:cols+f_rad);
end
% now do the columns
for col = 1:f_rad
    im(1:rows+2*f_rad,col) = im(1:rows+2*f_rad,f_rad+1);
end
for col = cols+f_rad+1:cols+2*f_rad
    im(1:rows+2*f_rad,col) = im(1:rows+2*f_rad,f_rad+cols);
end


for row = 1+f_rad:rows+f_rad         
    for col = 1+f_rad:cols+f_rad 
        % compute the submatrix to grab
        sub_mtx_rows = [row-f_rad, row+f_rad];
        sub_mtx_cols = [col-f_rad, col+f_rad];
        
        sub_mtx = im(sub_mtx_rows(1):sub_mtx_rows(2),sub_mtx_cols(1):sub_mtx_cols(2));
        sub_mtx = sub_mtx .* filter;

        summation = sum(sub_mtx);
        summation = sum(summation);
        new_im(row,col) = summation;
    end
end

im = new_im(1+f_rad:rows+f_rad,1+f_rad:cols+f_rad);



end

