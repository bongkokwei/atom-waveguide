function fano
clc;clf

x = linspace(0.1,0.5,1000); %2*pi*c/L
r = 0.5;
%V^2/vg = 0.002x
%Omega = 0.325x
Gamma = 0.02;
Omega = 0.225;
delta = 2*pi*x;

z = (Gamma./(Omega-x));

denom = exp(i*2*delta).*(r^2).*(1-i*z) - exp(-i*2*delta).*(1+i*z) - 2*i*r*z;
t_total = (1-r^2)./denom;

%Transmission
T = conj(t_total).*t_total;

hold on
plot(x,T,'b')
xlabel('Frequency(2\pic/l)')
str1 = sprintf('Omega = %g, r = %g, V^2/v_g = %g',Omega,r,Gamma);
text(0.275,0.4,str1)
hold off


end