% w_0 = [0, 0, 50, 50]'; % Ser consistente con usar filas o columnas. Vector Columna
function output = closure_test(sampling_period)
% COSNTANT_DT 
% Esta funcion devuelve una funcion para dt, que en este caso sera constante, 
% con el valor que haya indicado el usuario.
    
    function dt = fun(w,t)
        % Aqui tambien hay documentacion
        dt = w(3)*sampling_period;
        % dt = sampling_period;
    end
    output = @fun;
end