function [f_0, A_0, df_dt_0] = cannon(w, t, g)
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

    f_0 = [w(3), w(4), 0, -g]';
    A_0 = [[0, 0, 1, 0]; ... % fila 1 
           [0, 0, 0, 1]; ... % fila 2
           [0, 0, 0, 0]; ...
           [0, 0, 0, 0]];
       
    df_dt_0 = [0, 0, 0, 0]';

end