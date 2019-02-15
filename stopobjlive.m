global r1;
global count spath; 
disp('stop')
stop(r1)
mySpeech = getaudiodata(r1, 'int16'); % get data as int16 array
if (count == 1) 
audiowrite(mySpeech,'C:\eqari\sample.wav');
disp('path0');
end
if (count == 0) 
audiowrite(mySpeech,'c:\eqari\samplelive1.wav');
spath = ('c:\eqari\samplelive1.wav');
disp(spath);
end
audioplayer(mySpeech,8000);
disp('played')
