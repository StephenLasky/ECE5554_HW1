% im = im2single(imread('data/images/101085.jpg'));
im = im2single(imread('swedishflag.jpg'));
% im = rgb2gray(im);

% figure(); imshow(im);

[mag, theta] = gradientMagnitude(im,1);

highest = -100;
for x = 1:374
    for y = 1:374
        if theta(x,y) > highest
            highest = theta(x,y);
        end
    end
end
disp(highest);
% figure(); imshow(mag+0.5);

% x = edge(im,'canny');
% 
% figure(); imshow(x);





display('Program finished.');