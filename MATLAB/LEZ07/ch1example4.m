load handel;
sound(y,Fs);
y2 = flipud(y);
sound(y2,Fs);
subplot(2,1,1);plot(y)
axis tight;
subplot(2,1,2);plot(y2)
axis tight;
set(findall(gcf,'-property','FontSize'),'FontSize',18)