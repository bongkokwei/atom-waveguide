function [E, C] = concur(Rho)
%% Entanglement of Formation, only for two qubit
    sigma_y = kron([0 -1i; 1i 0],[0 -1i; 1i 0]);
    Rho_tilde = sigma_y*conj(Rho)*sigma_y;
    R = Rho*Rho_tilde;
    d = sqrt(eig(R));
    
    C = d(1) - d(2) - d(3) - d(4); 
    if real(C) <= 0
        C = 0;    
        E = 0;
    else
        plus = 1/2 + sqrt(1-C^2)/2;
        minus = 1/2 - sqrt(1-C^2)/2;
        E = -plus*log2(plus) - minus*log2(minus);
    end
end