function [y,yMono,fs] = ster2mono(path,filename)
[y,fs] = audioread([path,'\',filename]);
if size(y,2) == 2 % yes it is stereo
    yMono = sum(y,2)/2;
    audiowrite([path,'\',filename(1:end-4),'mono.wav'],yMono,fs)
    disp('file successfully converted.')
else
    yMono=y;
    disp('file is already mono.')
end
    
