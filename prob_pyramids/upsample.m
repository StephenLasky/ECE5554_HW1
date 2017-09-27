function im = upsample( im )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

[height,width] = size(im);
new_im = zeros(2*height, 2*width, 'single');


for row = 1:height
    for col = 1:width
        x = im(row,col);
        sub_mtx = [ x x; x x];
        
        yl = 2*(row-1) + 1;
        yu = yl + 1;
        xl = 2*(col-1) + 1;
        xu = xl + 1;
        new_im(yl:yu, xl:xu) = sub_mtx;
    end
end

im = new_im;





end

