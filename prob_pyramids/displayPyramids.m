function displayPyramids(G, L)
% Displays intensity and fft images of pyramids
% assumes the FIRST element in the G, L array is the original image
% also assumes that the images are not the same size and are presented in
% the following order: original, original/2, original/4, original/8, etc..

size = size(G);
[height, width] = size(G(0));
new_frame = zeros(height, width * size);

curr_x = 1

for i = 1:size
    im = G(i);
    % up-sample the image as necessary
    for j=1:(i-1)
        im = upsample(im);
    end
    
    % now add the image to the new frame
    xs = curr_x;
    xe = curr_x + width - 1;
    new_frame(xs:xe) = im(1:height,1:width);
    x_curr = x_curr + width
end

write_im(new_frame)

end