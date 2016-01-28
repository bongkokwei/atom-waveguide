function H = hamiltonian(n,gamma,delta,n_tilde,J,omega)
%% Creates the Hamilitonian for Many-Body System
% Input parameter will be the number of particles in the system
    sigma_z = [1 0; 0 -1];
    sigma_x = [0 1; 1 0];
    sigma_m = [0 0; 1 0];
    sigma_p = [0 1; 0 0];
    
    H_1 = 1; H_2 = 1; 
    H_3 = 1; H_4 = 1; H_5 = 1;
     
    H = zeros(2^n,2^n);
    
    for j = 1:n
        for i = 1:n
            if(i==j)
                H_1 = kron(H_1,sigma_z);
                H_3 = kron(H_3,sigma_x);
            else
                H_1 = kron(H_1,[1 0;0 1]);
                H_3 = kron(H_3,[1 0;0 1]);
            end        
        end
  
        H = H - (delta/2)*H_1 + omega*H_3;
        H_1 = 1;H_2 = 1;H_3 = 1;
    end
    
    for l = 1:n-1
        for m = 1:n-1
            if(l==m)
                H_2 = kron(H_2,kron(sigma_z,sigma_z));
            else
                H_2 = kron(H_2,[1 0;0 1]);
            end        
        end
        H = H - J*H_2;
        H_2 = 1;
    end
end