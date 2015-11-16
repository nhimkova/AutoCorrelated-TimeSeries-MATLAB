
subplot(3,1,1)
%plot MIDAS and realized VAR
number=length(Vmidas);
x=1:number;
y1=Vmidas;
y2=realV(13:882);
plot(x,y1,x,y2);
title('Midas and realized VAR')
legend('MIDAS','Realized VAR')

subplot(3,1,2)
%plot GARCH and realized VAR
x1=1:881;
g1=Vgarch(1:881,1);
g2=realV(2:882);
plot(x1,g1,x1,g2)
title('GARCH and realized VAR')
legend('GARCH','Realized VAR')

subplot(3,1,3)
%plot Rolling window and realized VAR
x2=1:880;
%h1=VGARCH(1:882,1);
h2=Vrw2m(1:880);
h3=realV(3:882);
plot(x2,h2,x2,h3);
title('Rolling window realized VAR');
legend('Rolling window','Realized VAR');
