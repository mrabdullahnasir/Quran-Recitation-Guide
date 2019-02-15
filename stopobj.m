global r;
disp('stop')
stop(r)
y = getaudiodata(r, 'int16'); % get data as int16 array
audiowrite('C:\eqari\sample.wav', y, 8000);
audioplayer(y,8000);
disp('played')
