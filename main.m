function main
    clc;clf
    %Declare initial conditions
    rho = [0.5 0.5; 0.5 0.5];
    tau = 1e-5;
    tInit = 0; tFinal = 15;
    tStep = tFinal/tau
    Rho = zeros(2,2,tStep);
    T = linspace(tInit,tFinal,tStep);
    
    for i = 1:tStep
        rho = euler(rho,T(i),tau,@r_Dot,0);
        Rho(:,:,i) = rho;
    end
    
    hold on;
    plot(T,squeeze(Rho(1,1,:)),'b')
    plot(T,squeeze(Rho(1,2,:)),'r')
    plot(T,squeeze(Rho(2,1,:)),'g')
    plot(T,squeeze(Rho(2,2,:)),'c')
    hold off   
end

function rho_dot = r_Dot(rho,~,~)
%% Master Equation for a two state-atom in thermal equilibrium
    sigma_z = [1 0; 0 -1];
    sigma_m = [0 0; 1 0];
    sigma_p = [0 1; 0 0];
    %rho = reshape(rho,2,2);
    omega_A = 1;
    gamma = 0;
    n = 0;
    %dependent on temperature exp(-beta*omega)/(1-exp(-beta*omega))
    
    rho_dot = -1i*(0.5)*(omega_A)*(sigma_z*rho - rho*sigma_z) + ...
              (gamma/2)*(n+1)*(2*sigma_m*rho*sigma_p - ...
              sigma_p*sigma_m*rho - rho*sigma_p*sigma_m) + ...
              (gamma/2)*(n)*(2*sigma_p*rho*sigma_m - ...
              sigma_m*sigma_p*rho - rho*sigma_m*sigma_p);
    %rho_dot = reshape(rho_dot,1,4);
end