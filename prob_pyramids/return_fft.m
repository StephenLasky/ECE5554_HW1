function im = return_fft( im )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% partial source: https://stackoverflow.com/questions/46496118/matlab-convert-imagesc-result-to-an-image?noredirect=1#comment79968692_46496118

h = imagesc(log(abs(fftshift(fft2(im))))); % imagesc handle

%turn off the axes
axis off
%save the image
saveas(im,'test.png')
%read the saved image
im = imread('test.png');





end

