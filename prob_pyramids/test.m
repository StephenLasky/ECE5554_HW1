% Primary Test Code %
% im = rgb2gray(im2single(imread('tesla.jpg')));
% [G,L] = pyramidsGL(im,5);
% displayPyramids(G,L);

% Other test Code %
im = rgb2gray(im2single(imread('tesla.jpg'))); % get image
h = imagesc(log(abs(fftshift(fft2(im))))); % imagesc handle

%turn off the axes
axis off
%save the image
saveas(h,'test.png')
%read the saved image
im_fft = imread('test.png');
%remove white border
sum_img = sum(im_fft,3); sum_img(sum_img(:) ~= 255*3) = 0; sum_img = logical(sum_img);
im_fft = im_fft(~all(sum_img,2), ~all(sum_img,1),:);
%Done!
figure, imshow(im_fft)





disp('Program finished.');



