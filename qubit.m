function rho_dot = qubit(rho,~,~)
%% Master Equation for 2-qubit System
    sigma_z = [1 0; 0 -1];
    sigma_m = [0 0; 1 0];
    sigma_p = [0 1; 0 0];
%Declare constant
%Assumption: all constants are equal in value for each harmonic oscillator
    gamma = 0.8;
    omega = 1;%Rabi frequency
    T = 0;
    delta = 0;
    J = 1.5;
    n_tilde = exp(-omega/T)/(1-exp(-omega/T));
    smOne = kron(sigma_m, eye(2));
    spOne = kron(sigma_p, eye(2));
    smTwo = kron(eye(2), sigma_m);
    spTwo = kron(eye(2), sigma_p);
    
    H_eff = hamiltonian(2,gamma,delta,n_tilde,J,omega);
    
    rho_dot = -1i*(H_eff*rho - rho*H_eff) + ...
              (gamma/2)*(n_tilde + 1)*...
        (2*smOne*rho*spOne - spOne*smOne*rho -rho*spOne*smOne) + ...
              (gamma/2)*(n_tilde + 1)*...
        (2*smTwo*rho*spTwo - spTwo*smTwo*rho -rho*spTwo*smTwo) + ...
              (gamma/2)*(n_tilde)*...
        (2*spTwo*rho*smTwo - smTwo*spTwo*rho -rho*smTwo*spTwo) + ...
              (gamma/2)*(n_tilde)*...
        (2*spOne*rho*smOne - smOne*spOne*rho -rho*smOne*spOne);
end