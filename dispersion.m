function dispersion
clc;clf;
d = 3.4e-2;
Gamma = 0.05; %V^2/vg
K = linspace(0,pi,1000);
Ek = linspace(0,3.5,1000);
[X,Y] = meshgrid(K,Ek);
Y(Y==1) = NaN;
Z = cos(X) - cos(2*pi*Y*d) + (Gamma./(1-Y)).*sin(2*pi*Y*d);

hold on
contour(K,Ek,Z,[0,0],'b')
plot(K,1,'-b')
ylabel('\omega/\Omega');
xlabel('Kd');
set(gca,'xtick',0:pi/4:pi)
set(gca,'xticklabel',{'0','pi /4','pi/2','3pi/4','pi'})
str1 = sprintf('d = %s',d);
text(2,3,str1)

hold off

end