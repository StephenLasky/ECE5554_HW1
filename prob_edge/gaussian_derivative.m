function filter = gaussian_derivative( direction, sigma )
% Creates gaussian derivative filter

f_rad = ceil(3 * sigma);            % compute the radius of the filter
f_width = 1 + 2 * f_rad;            % we assume this is an odd number
f_size = f_width*f_width;

% construct the filter 
filter = ones(f_width,f_width,'single');
[rows,cols] = size(filter);

% for x direction
if direction == 'x'
    for row = 1:rows
        for col = 1:cols
            y = (f_rad+1) - row;
            x = col - (f_rad+1);
            G = x*exp(-(x^2+y^2)/(2*sigma^2));
            filter(row,col) = G;
        end
    end
elseif direction == 'y'
    for row = 1:rows
        for col = 1:cols
            y = (f_rad+1) - row;
            x = col - (f_rad+1);
            G = y*exp(-(x^2+y^2)/(2*sigma^2));
            filter(row,col) = G;
        end
    end
else
    disp('gaussian_derivative: WARNING: improper direction parameter');
end

filter = -(1.0/(2*pi*sigma^4)) * filter;

end

