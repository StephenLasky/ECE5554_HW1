% Primary Test Code %
im = rgb2gray(im2single(imread('tesla.jpg')));
% im = gaussian_filter(im,1);
% im = downsample(im);
im = gaussian_filter(im,1);
im = downsample(im);
[G,L] = pyramidsGL(im,5);
% displayPyramids(G,L);

figure(); imshow(im);

% % im = L{1,1};
% high_freq = 2*L{1,1};
% % low_freq = G{1,1};
% low_freq = gaussian_filter(upsample(im),1);
% 
% im = im + high_freq;
% 
% 
% figure(); imshow(high_freq);
% figure(); imshow(low_freq);
% figure(); imshow(im);

% Other test Code %
% im = rgb2gray(im2single(imread('tesla.jpg'))); % get image
% im = downsample(im);
% im = downsample(im);
% [G,L] = pyramidsGL(im,3);
% displayPyramids(G,L);






disp('Program finished.');



