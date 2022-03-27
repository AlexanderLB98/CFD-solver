function [stop] = stop_at_niter(i, n)
%STOP_AT_NITER Summary of this function goes here
%   Detailed explanation goes here
%   Input:  i: contador
%           n: iteraciones maximas
%       
%   Output
%           stop : False si hay que seguir calculando, true si hay que parar.

    stop = false;
    if i >= n
        stop = true;    % Oye párate!
    end
end

