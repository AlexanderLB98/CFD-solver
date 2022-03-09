function output = constant_dt(sampling_period)
% COSNTANT_DT 
% En el proyecto hay que establecer condiciones de contorno. Se puede
% montar con una forma parecida a esta. Tenemos una funcion que devuelve la
% configuracion del problema, 
    
    function dt = fun(w,t)
        % Aqui tambien hay documentacion
        dt = sampling_period;
    end
    output = @fun;
end

