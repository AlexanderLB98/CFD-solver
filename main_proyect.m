%% This is the main file for the proyect
% Vector de estado inicial (posicion y velocidad)
w_0 = [0, 0, 50, 50]'; % Ser consistente con usar filas o columnas. Vector Columna
t_0 = 0;
t_max = 10;
dt = 1E-3;
a_x = 0;
a_y = -9.80665;
w = w_0; % inicializo
t = t_0;

problem = @(w, t) fun_energy(w, t, -a_y);   % Fisica del problema
stopping_condition = @stop_at_niter;        % Condicion de parada
propagator = @fw_euler;           
dt_calculator = constant_dt(1E-3);          % Clausura, funcion que devuelve funciones. 
manager = results_saver(1E-3);


