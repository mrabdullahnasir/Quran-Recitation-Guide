function w=hamming(n)
%    HAMMING generates a rectangular window
%    W=HAMMING(N) returns an N point symmetric HAMMING window
%
% R Pawlowicz Feb/2005



w =0.54 - 0.46*cos(2*pi*(0:(n-1))/(n-1));


