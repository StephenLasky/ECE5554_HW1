function [G, L] = pyramidsGL(im, N)
% [G, L] = pyramidsGL(im, N)
% Creates Gaussian (G) and Laplacian (L) pyramids of level N from image im.
% G and L are cell where G{i}, L{i} stores the i-th level of Gaussian and Laplacian pyramid, respectively. 

im = rgb2gray(im2single(imread('tesla.jpg')));
sigma = 1;

G = [im];

for iteration = 2:N
    im = gaussian_filter(im,sigma);
    im = downsample(im);
    
    G = [G,im];
end





end

