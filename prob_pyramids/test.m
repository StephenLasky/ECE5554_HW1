

mask_width = 5;
sigma = 2;
im = rgb2gray(im2single(imread('tesla.jpg')));

% im = gaussian_filter(im);

x = ones(5,5);

i = 1;
for row = 1:5
    for col = 1:5
        x(row,col) = i;
        i = i + 1;
    end
end

x
z = x(2:4,2:4)
y = sum(z)
y = sum(y)

    
           

% display the image
% figure(1); imshow(im);









