function filter = gaussian_derivative_rotated( direction, sigma, theta, a )
% Creates gaussian derivative filter
% INPUTS:   direction:  direction in which the filter is oriented ('x','y')
%           sigma:      sigma constant of the gaussian curve
%           theta:      the number in radians how how mcuh to rotate the
%           filter, spans between [0,2pi]. For example, pi/2 would mean
%           rotate the entire filter 90 degrees left.
%           a:          the constant to 'stretch' the filter by. gets
%           applied to whatever direction the filter is facing

theta = -theta;                     % flip the sign on theta for proper rotation

a_amp = ceil((a)^(0.125));              % used to help maintain proper widths for larger amplitudes  
f_rad = a_amp*ceil(3 * sigma);            % compute the radius of the filter
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
            
            G = x*exp(-(x^2+a*y^2)/(2*sigma^2));
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
            
            G = y*exp(-(a*x^2+y^2)/(2*sigma^2));
            filter(row,col) = G;
        end
    end
else
    disp('gaussian_derivative: WARNING: improper direction parameter');
end

filter = -(1.0/(2*pi*sigma^4)) * a * filter;

end

