im = rgb2gray(im2single(imread('tesla.jpg')));
[G,L] = pyramidsGL(im,10);

displayPyramids(G,L);

% A = ones(5,5);
% B = zeros(3,3);
% 
% A(2:3,3:4) = B(2:3,2:3)







% 
% display the image
% figure(1); imshow(orig_im);
% figure(2); imshow(im);


disp('Program finished.')






