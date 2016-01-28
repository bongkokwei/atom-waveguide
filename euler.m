function xout = euler(x,t,tau,derive,param)
%% Euler integrator
    % Input arguments -
    % x = current value of dependent variable
    % t = independent variable (usually time)
    % tau = step size (usually timestep)
    % derivsRK = right hand side of the ODE;
    % derivsRK is the name of the function which returns dx/dt
    % param = extra parameters passed to derivsRK
    % Output arguments -
    % xout = new value of x after a step of size tau
    F = feval(derive,x,t,param);
    xout = x + tau.*F;
    return;
end