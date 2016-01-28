function atoms
%% Stochastic Resonance
    clc;clf
    %Declare initial conditions
    %rho = 0.5*[0 0 0 0; 0 1 1 0; 0 1 1 0; 0 0 0 0];
    %rho = 0.25*[1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    rho = [1 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0];
    tStep = 5000; tFinal = 50; tau = tFinal/tStep;
    Rho = zeros([size(rho) tStep]);
    E = zeros(1,tStep); C = zeros(1,tStep);
    T = linspace(0,tFinal,tStep);
    diag = zeros(1,tStep); %To check if trace is constant throughout
    
    for i = 1:tStep 
        Rho(:,:,i) = rho;
        diag = trace(Rho(:,:,i));
        [E(i),C(i)] = concur(Rho(:,:,i));
        rho = rk4(rho,T(i),tau,@qubit,0); 
    end
    hold on;
    plot(T,C,'m')
    hold off
    
    
end