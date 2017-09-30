function filter = gaussian_derivative_rotated( direction, sigma, theta )
% Creates gaussian derivative filter

theta = -theta;                     % flip the sign on theta for proper rotation

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
            
            % translate by given theta parameters
            y_prime = x*sin(theta) + y*cos(theta);
            x_prime = x*cos(theta) - y*sin(theta);
            y = y_prime;
            x = x_prime;
            
            G = x*exp(-(x^2+y^2)/(2*sigma^2));
            filter(row,col) = G;
        end
    end
elseif direction == 'y'
    for row = 1:rows
        for col = 1:cols
            y = (f_rad+1) - row;
            x = col - (f_rad+1);
            
            % translate by given theta parameters
            y_prime = x*sin(theta) + y*cos(theta);
            x_prime = x*cos(theta) - y*sin(theta);
            y = y_prime;
            x = x_prime;
            
            G = y*exp(-(x^2+y^2)/(2*sigma^2));
            filter(row,col) = G;
        end
    end
else
    disp('gaussian_derivative: WARNING: improper direction parameter');
end

filter = -(1.0/(2*pi*sigma^4)) * filter;

end

