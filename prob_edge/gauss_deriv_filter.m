function im = gauss_deriv_filter( im, sigma, direction, theta, a )
% IMPLEMENTS gauss derivative filter
%   Detailed explanation goes here

% construct the filter 
filter = gaussian_derivative_rotated(direction, sigma, theta, a);
[f_height, f_width] = size(filter);
f_rad = (f_width-1)/2;

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


