function im = return_fft( im )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% partial source: https://stackoverflow.com/questions/46496118/matlab-convert-imagesc-result-to-an-image?noredirect=1#comment79968692_46496118

h = imagesc(log(abs(fftshift(fft2(im))))); % imagesc handle

%turn off the axes
axis off
%save the image
saveas(h,'test.png')
%read the saved image
im_fft = im2single(imread('test.png'));
%remove white border
sum_img = sum(im_fft,3); sum_img(sum_img(:) ~= 255*3) = 0; sum_img = logical(sum_img);
im = im_fft(~all(sum_img,2), ~all(sum_img,1),:);





end

