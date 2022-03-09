function [stop] = stop_at_floor(w, t)
%STOP_AT_FLOOR Summary of this function goes here
%   Detailed explanation goes here
%   Hay que rellenar esto
%   Output
%   stop : False si hay que seguir calculando, true si hay que parar.

    stop = false;
    if ((t>0.) && (w(2) <= 0.))
        stop = true;    % Oye párate!
    end
end

