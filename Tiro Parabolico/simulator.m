function results = simulator(w_0, t_0, problem, propagator, dt_calculator, ...
    stopping_condition, manager)
w = w_0;
t = t_0;
results = manager(w_0, t_0, []);
%SIMULATOR Summary of this function goes here
    while (stopping_condition(w,t) == false) % mientras tenga altura. Aqui se usará una condicion de parada
        dt = dt_calculator(w, t);
        w = propagator(w, t, problem, dt);
        t = t + dt;
        results = manager(w, t, results);
        %i = i+1; 
    end
end

