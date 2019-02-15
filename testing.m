
%-----------------------Dynamic threshhold-----------------------------
global pssel;
global pasel;
threshhold = 2;
min_threshhold = 4.0;
verse = strcat(pssel,'-',pasel);
if(strcmp(verse,'1-1'))
    threshhold = 4.5;
end
if(strcmp(verse,'1-2'))
    threshhold = 2;
end
if(strcmp(verse,'1-3'))
    threshhold = 2;
end

if(strcmp(verse,'2-1'))
    threshhold = 2;
end
if(strcmp(verse,'2-2'))
    threshhold = 1.95;
end
if(strcmp(verse,'2-3'))
    threshhold = 1.85;
end

if(strcmp(verse,'3-1'))
    threshhold = 4.6;
end
if(strcmp(verse,'3-2'))
    threshhold = 1.95;
end
if(strcmp(verse,'3-3'))
    threshhold = 1.92;
end
%-----------------------End - Dynamic threshhold-----------------------------


n=6;
%distance=zeros(28,n);
r=1;
count=0;

    [s, fs] = audioread('C:\eqari\sample.wav');      
        
   % v = melcepst(S,fs); %(s, fs,'M',12,20,256);           % Compute MFCC's
   
   %-----------------------MFCC Test-----------------------------
    nc=12;
    p=31;
    n=128;
    inc=floor(n/2);
    fl=0.0115;
    fh=0.5;  
 
    %z=enframe(s,hamming(n),inc);    % Overlaping of frames and apply Hamming Window

    [z,nf]=ovpframe(s,n,inc);
     
     win = hamming(n);
     w = win(:)';
     z = z .* w(ones(nf,1),:);
    
    
    
    f=rfft(z.');                    % Fast Fourier Transformation
    
    [m,a,b]=melbankm(p,n,fs);       % Mel-Frequency Filter Banks


    pw=f(a:b,:).*conj(f(a:b,:));
    pth=max(pw(:))*1E-6;
    ath=sqrt(pth);                   % Threshold
   
   y=f(a:b,:);
   y0=abs(y);
   y1=m*y0;                         % Convertion to Mel Scale
   y2=max(y1,ath);
   y3=log(y2);

    v=rdct(y3).';

    nf=size(v,1);
    nc=nc+1;
    v(:,nc+1:end)=[];          %Consider Only 12 Coeff.
    v(:,1)=[];                 % Exclude zeroth Coeff.
    
   % ------------------------MFCC Test----------------------
   %threshold=[1.9742 2.0842 2.1633 2.4358 2.0649 2.2108 2.3120 2.1482 2.4423 2.2024 2.3124 2.133];
            
    distmin = inf;
    k1 = 0;
   
    lc=length(code);            % No. Of Codewords In Code Book
    
    for l = 1:lc                % Check Each CodeBook
        d0 = disteusq(v, code{l});   % Find Distance with each Code Book 
        d1=min(d0,[],2);
        d2=sum(d1);
        d3=size(d0,1);
        dist = d2 / d3;         % Distorsion
        
        distance(l,r)=dist;
        
        if dist < distmin
            distmin = dist;
            k1 = l;             % Speaker with Min. Distorsion   
        end      
    end
     r=r+1;
    disp(distmin);
    disp(threshhold)
     if (distmin < threshhold && distmin > min_threshhold)
        givemsg = sprintf('You have correctly recite the verse.');
    else
	givemsg = sprintf('You didnt recite the verse correctly. Please try again.');
    end       
global resmsg;
resmsg = givemsg;

    
%---------------------------------End of Training----------------
%------------------------------------------------------------------