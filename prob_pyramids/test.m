im = rgb2gray(im2single(imread('tesla.jpg')));
[G,L] = pyramidsGL(im,7)

displayPyramids(G,L)






% display the image
% figure(1); imshow(orig_im);
% figure(2); imshow(im);









