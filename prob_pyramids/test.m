

mask_width = 5;
sigma = 2;
im = rgb2gray(im2single(imread('tesla.jpg')));
orig_im = im;

tic
im = gaussian_filter(im);
toc

% x = ones(5,5,'single')
% x = padarray(x,[3 3],0,'both')






    
           

% display the image
figure(1); imshow(orig_im);
figure(2); imshow(im);









