function [mag,theta] = orientedFilterMagnitude(im)

sigma = 1;
a = 4;          % applies amplitude to the gaussian derivative filter

% smooth image first
filter = fspecial('Gaussian', sigma*4+1, sigma);
im = imfilter(im, filter);

% initialize some variables used later
num_directions = 8;
theta_step = 2*pi / num_directions;
[ height, width, depth ] = size(im);
gradients = zeros(height,width,depth,num_directions, 'single');

% compute various directional gradients , bounded by the number of
% directions, for each color
for color = 1:depth
    for theta = 0:num_directions-1
        gradients(1:height,1:width,color,theta+1) = gauss_deriv_filter(im(1:height,1:width,color),sigma,'x', theta_step*theta, a);
    end
end

%  You will have Rx, Gx, Bx, take the L2-norm of them, you will get the x-gradient 
%  of this pixel. And then you do this for y-gradient.
new_gradients = zeros(height,width,num_directions);
% x direction
for direction = 1:num_directions
    for color = 1:depth
        new_gradients(1:height,1:width,direction) = new_gradients(1:height,1:width,direction) + gradients(1:height,1:width,color,direction) .^ 2;
    end
    new_gradients(1:height,1:width,direction) = new_gradients(1:height,1:width,direction) .^ (0.5);
end



% finally, compute the mag and theta for each pixel
% Suppose you have 8 filters with different orientation, you will get 8 responses with 8 different orientations. Choose the one with maximum value as the magnitude, and use the orientation of this filter as the orientation of the edge.
mag = zeros(height,width,'single');
theta = zeros(height,width,'single');
for row = 1:height
    for col = 1:width
        max_mag = new_gradients(row,col,1);
        max_mag_idx = 1;
        for d = 2:num_directions
            if new_gradients(row,col,d) > max_mag
                max_mag = new_gradients(row,col,d);
                max_mag_idx = d;
            end
        end
        mag(row,col) = max_mag;
        theta(row,col) = new_gradients(row,col,max_mag_idx);
    end
end

end