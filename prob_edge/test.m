% im = im2single(imread('data/images/101085.jpg'));
im = im2single(imread('swedishflag.jpg'));

% filter2 = gaussian_derivative_rotated('y',50,0);
% filter = gaussian_derivative_rotated('y',50,(pi/4));
% 
% figure(); imshow(filter2 * 500000 + 0.5);
% figure(); imshow(filter * 500000 + 0.5);


im = edgeGradient(im);

figure(); imshow(im);


display('Program finished.');