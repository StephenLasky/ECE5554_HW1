function [G, L] = pyramidsGL(im, N)
% [G, L] = pyramidsGL(im, N)
% Creates Gaussian (G) and Laplacian (L) pyramids of level N from image im.
% G and L are cell where G{i}, L{i} stores the i-th level of Gaussian and Laplacian pyramid, respectively. 

sigma = 1;

G = {im};
   
for i = 2:N+1             % need to compute 1 additional level for laplacian pyramid, need to remove this level later
    im = gaussian_filter(im,sigma);
    im = downsample(im);
%     im = imresize(im, 0.5,' nearest');
    
    G{i} = im;
end

im = G{1,1};
L = {};

for i = 1:N
    % for the laplacian image:
    % L_0 = G_0 - UPSAMPLE(G_1)
    % where L_0 is current laplacian image we are trying to calculate
    % G_0 is current gaussian image
    % G_1 is next gaussian image
    G_0 = G{1,i};
    G_1 = G{1,i+1};
    G_1 = upsample(G_1);
    L_0 = G_0 - G_1;
    
    
    L{i} = L_0;
end


G = G(1,1:N);      % delete the extra gaussian image


end

