function lorentz
    clc; clf;
    x = linspace(0,2,1000); %Ek/Omega
    width = 0.05; %V^2/(Omega*vg)

    R = width^2./((1-x).^2 + width^2);
    T = 1 - R;

    hold on
    xlabel('E_k/\Omega')
    f = plot(x,R,'r-');
    g = plot(x,T,'--');
    hold off
    
    saveas(f, 'image.jpg');
end
