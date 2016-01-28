function fabry
clc;
x = linspace(4,16,1000); %delta
r = 0.4;
R = r^2;

t = (1-r^2)./(1-r^2.*exp(i*2.*x));
T = t.^2;
Tc = (1 - R)^2./(1 + R^2 - 2*R*cos(2*x));

hold on
plot(x,T,'r')
plot(x,Tc,'g')
hold off
end