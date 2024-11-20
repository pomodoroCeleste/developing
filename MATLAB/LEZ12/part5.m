thresh = 0.1;
tt = find ( zfData > thresh );
% Now let's plot it on top of the original signal in red.
% The "hold on" command allows you to plot on the same plot again
% (the default is to erase the old plot and do the new plot).
% You can turn this off using "hold off".
figure(3);
plot(tim, zfData,'b');
hold on;
plot( tim(tt), zfData(tt) ,'r' );
hold off;
