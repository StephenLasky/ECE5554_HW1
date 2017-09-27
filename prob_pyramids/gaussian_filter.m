function im = gaussian_filter( im )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

sigma = 2
f_width = 5 % we assume this is an odd number

[rows,cols] = size(im);
new_im = zeros(rows,cols, 'single');

for row = 1:512         % should be rows
    for col = 1:512     % should be cols
        sum = 0.0;
        
        for f_row = 1:f_width
            for f_col = 1:f_width
                % so, our current pixel is at row,col
                % the filter pixel is currently at f_row, f_col
                % need to calculate the pixels we are operating on, n_row
                % and n_col
                
                n_row = row - (f_width-1)/2 + f_row - 1;
                n_col = col - (f_width-1)/2 + f_col - 1;
                
                if n_row < 1 || n_col < 1 || n_row > rows || n_col > cols
                    sum = sum + 1.0;
                else
                    sum = sum + im(n_row,n_col);
                end
            end
        end
        
        average = sum / (f_width*f_width);
        new_im(row,col) = average;
    end
end

im = new_im;



end

