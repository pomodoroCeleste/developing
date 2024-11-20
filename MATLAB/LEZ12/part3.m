% First, we need a signal - let's use the zebra finch song
[ zfData, zfFs] = audioread('zfinch.wav');
% Now we reverse it. "end" is the last value in our variable "zfData". "1"
% is the first value in our variable "zfData". The "-1" in the middle is the
% step size. It defaults to "1" - but we can give it whatever value you want, and
% "-1" means that the steps will go 1 at a time from the end to the first value.
zfRev = zfData(end:-1:1);
% That is all there is to it...
% We can halve the sample rate for both reverse and forward songs...
zfHalfRev = zfData(end:-2:1);
zfHalfData = zfData(1:2:end);
% Let's plot!
figure(1);
subplot(2,1,1);
plot(zfHalfData);
subplot(2,1,2);
plot(zfHalfRev);
