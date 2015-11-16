%
%Scatterplot

%VMIDAS--VRealized
load midas;
subplot(3,1,1)

plot(log(Vmidas),log(realV(13:end)),'*')
xlabel('MIDAS')
ylabel('Realized')

%GARCH--Realized
subplot(3,1,2)

plot(log(Vgarch(3:end,1)),log(realV(3:end-1)),'*')
xlabel('GARCH')
ylabel('Realized')


%Rolling Window--Realized
subplot(3,1,3)

plot(log(Vrw2m(1:end)),log(realV(3:end)),'*')
xlabel('Rolling Window')
ylabel('Realized')
