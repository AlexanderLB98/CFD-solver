function output = constant_dt(sampling_period)
% COSNTANT_DT 
% Esta funcion devuelve una funcion para dt, que en este caso sera constante, 
% con el valor que haya indicado el usuario.
    
    function dt = fun(w,t)
        % Aqui tambien hay documentacion
        dt = sampling_period;
    end
    output = @fun;
end