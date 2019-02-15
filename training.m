%------------------------SPEAKER RECOGNITION   MFCC------------------------

% Training

k = 32;         % number of centroids 

    i = 1;
    %-----------Saad Adding the path inputed from the selection class into
    %variable file ok .work tested on matlab prompt
    global spath;
    file = spath;           
   disp(spath);
    [s, fs] = audioread(file);
     %plot(s);
    %v = melcepst(s,fs);%(s, fs,'M',12,20,256);           % Compute MFCC's
    
    %-----------------------MFCC Train--------------------------------------
    
    nc=12;
    p=31;       
    n=128 ;     
    inc=floor(n/2);
    fl=0.02;
    fh=0.5;  
 
    %z=enframe1(s,hamming(n),inc);    % Overlaping of frames and apply Hamming Window
     [z,nf]=ovpframe(s,n,inc);
     
     win = hamming(n);
     w = win(:)';
     z = z .* w(ones(nf,1),:);
    
    f=rfft(z.');                    % Fast Fourier Transformation
    
    [m,a,b]=melbankm(p,n,fs);       % Mel-Frequency Filter Banks

    pw=f(a:b,:).*conj(f(a:b,:));

    pth=max(pw(:))*1E-6;
    ath=sqrt(pth);                 % Treshold
   
    y=f(a:b,:);
    y0=abs(y);
    y1=m*y0;                        % Convertion to Mel Scale
    y2=max(y1,ath);
    y3=log(y2);
    
    v=rdct(y3).';
    nf=size(v,1);
    nc=nc+1;
    v(:,nc+1:end)=[];        %Consider Only 12 Coeff.
    v(:,1)=[];               % Exclude zeroth Coeff.
    
  %-----------------------------MFCC Train--------------------------  
    
   code{i} = kmeanlbg(v, k);    % VQ LBG Algo  (Construction of Codebook)
%    code = kmeanlbg(v, k);
 
 
 %-----------------------------End of %Training------------------