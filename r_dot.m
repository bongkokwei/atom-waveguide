function rho_dot = r_dot(rho,~,~)
%% Master Equation for Many-Body System
    sigma_z = [1 0; 0 -1];
    sigma_m = [0 0; 1 0];
    sigma_p = [0 1; 0 0];
%Declare constant
%Assumption: all constants are equal in value for each harmonic oscillator
    gamma = 0.1;
    delta = 2; %detuning frequency
    n_tilde = 1; %mean number, dependent on T
    omega = 1; %Rabi frequency
    n = length(rho)/2; % Number of particle
    
    H_trans = h(sigma_p, sigma_m, rho, n);
    H_spon = h(sigma_m, sigma_p, rho, n);
    rho_dot = gamma*(n_tilde+1)*H_spon + gamma*n_tilde*H_trans;  
end

function H_default = h(sigma_1, sigma_2, rho, n)
%% A function to generate the spnontaneous emission and excitation term
    H_default = zeros(2^n,2^n);
    sigma_a = 1; sigma_b = 1;
    for i = 1:n
        for j = 1:n
            if(j==i)
                sigma_a = kron(sigma_a,sigma_1);
                sigma_b = kron(sigma_b,sigma_2);
            else
                sigma_a = kron(sigma_a,[1 0;0 1]);
                sigma_b = kron(sigma_b,[1 0;0 1]);
            end        
        end
        H_default = H_default + sigma_a*rho*sigma_b;
        sigma_a = 1; sigma_b = 1; 
    end
end
