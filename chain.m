function chain
clc; clf

%Constant declaration
V = 1;
vg = 1;
Omega = 1; %Energy will have units of omega
k = linspace(0,pi,1000); 
d = 3.4e-3;
%d = 3.4e-2;
%d = 3.4e-1; 
%d = 6.8e-2; 

z = (V^2/vg)/(Omega-Ek);

M_atom = [1-i*z -i*z; i*z 1+i*z];
M_free = [exp(i*k*d) 0; exp(i*k*d) 0];

M = M_atom*M_free;

end