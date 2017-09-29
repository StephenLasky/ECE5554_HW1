im = rgb2gray(im2single(imread('tesla.jpg')));
% im = downsample(im);
% im = downsample(im);
% 
[G,L] = pyramidsGL(im,7);
displayPyramids(G,L);


disp('Program finished.');

% im2 = upsample(downsample(gaussian_filter(im,1)));


