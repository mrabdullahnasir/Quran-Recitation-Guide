function [z,nf]=ovpframe(x,len,inc)

%	[z,nf] = ovpframe(s,len,inc) 
%   Splits the vector 's' into  overlaping frames. 
%    Each frame is of length 'len'and number of overlaped samples with previous frame are 'inc'. 
 %     The last few samples of 's' will be ignored if its length is not divisible by 'len'.
 %      It is an error if 's' is shorter than 'len'.
%      Each overlaped frame occupy a row of the output matrix 'z'. 
%      The number of overlaped frames are provided by 'nf'.

   
nx=length(x);
nf = fix((nx-len+inc)/inc);
z=zeros(nf,len);

indf= inc*(0:(nf-1)).';
inds = (1:len);

z(:) = x(indf(:,ones(1,len))+inds(ones(nf,1),:));


