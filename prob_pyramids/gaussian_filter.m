function im = gaussian_filter( im )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% no threads ~ 4.7 sec
% N = 1 ~ 9.5 sec
% N = 2 ~ 9.5 sec
% N = 4 ~ 9.7 sec
% parfor on innerloop > 30 sec

% LASTN = maxNumCompThreads(2)
% N = maxNumCompThreads

sigma = 2;
f_width = 25; % we assume this is an odd number
f_rad = (f_width-1)/2;
f_size = f_width*f_width;

% create matrix where the new image will be stored
[rows,cols] = size(im);
new_im = zeros(rows + 2*f_rad,cols + 2*f_rad, 'single');

% pad the original image with zeros
im = padarray(im,[f_rad f_rad],0,'both');




% construct the filter +
filter = ones(f_width,f_width,'single');



for row = 1+f_rad:rows+f_rad         
    for col = 1+f_rad:cols+f_rad 
        
        % compute the submatrix to grab
        sub_mtx_rows = [row-f_rad, row+f_rad];
        sub_mtx_cols = [col-f_rad, col+f_rad];
        
        

        sub_mtx = im(sub_mtx_rows(1):sub_mtx_rows(2),sub_mtx_cols(1):sub_mtx_cols(2));
            
            % move this out later
            summation = sum(sub_mtx);
            summation = sum(summation);
            average = summation / f_size;
            new_im(row,col) = average;

        

    end
end

im = new_im(1+f_rad:rows+f_rad,1+f_rad:cols+f_rad);



end

