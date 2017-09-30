function bmap = edgeOrientedFilters(im)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

[mag, thetas] = orientedFilterMagnitude(im);
bmap = nonmax(mag,thetas);

end

