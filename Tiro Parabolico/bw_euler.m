function [new_w] = bw_euler(w, t, problem, dt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FW_euler : Integrador temporal en forma de funcion
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Inputs: w : vector de estado. Es un vector columna. La primera componente 
%             es la posición segun el eje x. La segunda posicion en el eje y.
%             Unidades (m)
%         t : Tiempo en el que se evalua la derivada temporal de l vector de
%             estado (s).
%         g : Aceleracion de la gravedad. Positiva si es hacia abajo.
%             (m/s^2)
%                                                                  
% Outputs: f_0: Derivada temporal evaluada en el instante t
%          A_0: matriz jacobiana%                                                                  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [f_0, ~, ~] = problem(w, t);
    I = eye(size(A_0));
    B = (I - dt*A_0);
    c = dt*(f_0 - A_0 * w + dt*df_dt_0);
    new_w = linsolve(B,c); 
end
