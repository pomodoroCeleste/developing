% First let's get a signal and plot it:
[ zfData, zfFs ] = audioread('zfinch.wav');
tim = 1/zfFs:1/zfFs:length(zfData)/zfFs;
plot(tim,zfData);
% Perhaps we only want to examine the last syllable.
% We can use the "xlim" command to only plot the end.
% In this case we'll plot this syllable that starts at roughly
% 1.3 seconds and ends by 1.7 seconds.
xlim( [ 1.3 1.7 ] );
% There is also a "ylim" command for the y-axis, which does the same thing.
ylim([-0.75 0.75]);
% Now let's use the find command to get the time between 1.45 and 1.63.
pp = find ( tim > 1.45 & tim < 1.63);
% pp is now the sequence of sample positions (not samples!) for which
% tim is larger than 1.45 and smaller than 1.63.
% pp is just sequence of integers.
figure(2);
plot(pp);
% But here is how we use pp...
plot( tim(pp), zfData(pp) );
% or better yet...
figure(1);
plot( tim, zfData,'b');
hold on;
plot( tim(pp) , zfData(pp) ,'r');