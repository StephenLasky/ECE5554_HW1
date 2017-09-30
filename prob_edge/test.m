% im = im2single(imread('data/images/101085.jpg'));
im = im2single(imread('swedishflag.jpg'));
% im = rgb2gray(im);
[mag, theta] = gradientMagnitude(im,1);

im = nonmax(mag,theta);

figure(); imshow(im.^0.5);



% bmap = edgeGradient(im);



% figure(); imshow(bmap);




display('Program finished.');