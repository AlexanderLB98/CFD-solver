function [new_w] = fw_euler(w, t, problem, dt)
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
    new_w = w + dt*f_0; 
end

