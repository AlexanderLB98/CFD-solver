function output = results_saver(sampling_period)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
    function results = sampler(w, t, old_results)
        % A esta funcion le pasamos el vector de estado, el tiempo y los
        % resultados antiguos. Si ha pasado más de un tiempo que yo he
        % configurado (sampling_period), se va a almacenar otra fila.
        % Documentacion!!
        old_t = -sampling_period - 1;
        if (isempty(old_results) == false)
            old_t = old_results(end, 1);
        end
        results = old_results;
        % old_t = old_results(end, 1);
        if (t - old_t) >= sampling_period
            results = [old_results; 
                      [t, w']];
        end
    end
    output = @sampler;
end

