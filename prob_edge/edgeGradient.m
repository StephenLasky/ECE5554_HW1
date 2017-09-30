function bmap = edgeGradient(im);
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

sigma = 1;
[mag, thetas] = gradientMagnitude(im,sigma);
[rows, cols] = size(mag);

bmap = zeros(rows,cols);


for x = 1:rows
    for y = 1:cols
        theta = thetas(x,y);
        
        pp = 0.0;   % pixel in positive direction
        np = 0.0;   % pixel in negative direction
        
        theta = theta * 2;
        if theta >= 0.0 && theta < pi/4
            pp = cos(theta)*mag(y,x+1) + sin(theta)*mag(y+1,x+1);
            theta = theta - 2;
            np = cos(theta)*mag(y,x-1) + sin(theta)*mag(y-1,x-1);
        elseif theta >= pi/4 && theta < pi/2
            pp = sin(theta)*mag(y+1,x+1) -cos(theta)*mag(y+1,x);
            theta = theta - 2;
            np = sin(theta)*mag(y-1,x-1) -cos(theta)*mag(y-1,x);
        elseif theta >= pi/pi && theta < 0.75*pi
            pp = -cos(theta)*mag(y+1,x) - sin(theta)*mag(y+1,x-1);
            theta = theta - 2;
            np = -cos(theta)*mag(y-1,x) - sin(theta)*mag(y-1,x+1);
        elseif theta >= 0.75*pi && theta <= pi
            pp = -sin(theta)*mag(y+1,x-1) + cos(theta)*mag(y,x-1);
            theta = theta - 2;
            np = -sin(theta)*mag(y-1,x+1) + cos(theta)*mag(y,x+1);
        end
        
%         elseif theta >= -pi && theta < -0.75*pi
%         elseif theta >= -0.75*pi && theta < -pi/2
%         elseif theta >= -pi/2 && theta < -pi/4
%         elseif theta >= -pi/4 && theta < 0.0
                    
        
        
        
        
        
    end
end



end

