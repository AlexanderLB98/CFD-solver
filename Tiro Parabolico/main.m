% Vector de estado inicial (posicion y velocidad)
w_0 = [0, 0, 50, 50]'; % Ser consistente con usar filas o columnas. Vector Columna
t_0 = 0;
t_max = 10;
dt = 1E-3;
a_x = 0;
a_y = -9.80665;
w = w_0; % inicializo
t = t_0;

problem = @(w, t) cannon(w, t, -a_y); % Aqui defines el problema
stopping_condition = @stop_at_floor;
propagator = @fw_euler;
dt_calculator = constant_dt(1E-3); % Clausura, funcion que devuelve funciones. 
manager = results_saver(1E-1);


results_exp = simulator(w_0, t_0, problem, @fw_euler, dt_calculator, ...
    stopping_condition, manager);
results_imp = simulator(w_0, t_0, problem, @bw_euler, dt_calculator, ...
    stopping_condition, manager);

plot(results_exp(:,2), results_exp(:,3), '-k')
hold on
plot(results_imp(:,2), results_imp(:,3), '-k')
% Ya está hecho, pero está com1plicado para hacer cambios