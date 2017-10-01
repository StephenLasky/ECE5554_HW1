% Primary Test Code %
im = rgb2gray(im2single(imread('tesla.jpg')));
im = gaussian_filter(im,1);
im = downsample(im);
im = gaussian_filter(im,1);
im = downsample(im);
[G,L] = pyramidsGL(im,5);
displayPyramids(G,L);

% Other test Code %
% im = rgb2gray(im2single(imread('tesla.jpg'))); % get image
% im = downsample(im);
% im = downsample(im);
% [G,L] = pyramidsGL(im,3);
% displayPyramids(G,L);




disp('Program finished.');



