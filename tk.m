function tk
clc;clf;
x = linspace(-10,10,1000); %(k-E2)/gamma2

Omega = 1/2;
Gamma = 4;
Delta = 1;
gamma3= 0;

tk_nom = (x + Delta + 1i*gamma3).*(x + 1i/2 - 1i*Gamma/2)-Omega^2/4;
tk_den = (x + Delta + 1i*gamma3).*(x + 1i/2 + 1i*Gamma/2)-Omega^2/4;

Tk = ((tk_nom./tk_den)+1)/2;
Rk = ((tk_nom./tk_den)-1)/2;

hold on
ylim([0 1])
plot(x,Tk)

str = sprintf('Omega = %g, Gamma = %g, Delta = %g',Omega,Gamma,Delta);
title(str)
xlabel('(ck-E_2)/ \gamma');
ylabel('Transmission');
hold off
end