function mesh = mesh_processor(N_elements)
    cells = strcat('cells_',num2str(N_elements),'.dat');
    nodes  = strcat('nodes_',num2str(N_elements),'.dat');
    
    cells = readtable("files/" + cells);
    mesh.cells = table2array(cells); % Dimensiones N_elementsx3. Indica los
    % nodos que forman las diferentes celdas (3 nodos por celda)
    nodes = readtable("files/" + nodes);
    mesh.nodes = table2array(nodes);
    % bc = readtable("files/" + bc);
    % mesh.bc = table2array(bc);
    % mesh.cells(3,2) indica el indice del segundo nodo que forma la celda
    % numero 3. Las coordenadas de dicho nodo seran mesh.nodes(mesh.cells(3,2), :)

    %% Areas
    mesh.area = zeros(N_elements, 1);
    mesh.area(N_elements)

    cell_index = linspace(1,N_elements, N_elements);
        
    p1 = mesh.cells(cell_index, 1); % Punto 1 de todas las celdas
    p2 = mesh.cells(cell_index, 2); % Punto 2 de todas las celdas
    p3 = mesh.cells(cell_index, 3); % Punto 3 de todas las celdas
    p1_p = [mesh.nodes(p1, 1) mesh.nodes(p1, 2)]; % Coordenadas de los p1 de todas las celdas
    p2_p = [mesh.nodes(p2, 1) mesh.nodes(p2, 2)]; % Coordenadas de los p2 de todas las celdas
    p3_p = [mesh.nodes(p3, 1) mesh.nodes(p3, 2)]; % Coordenadas de los p3 de todas las celdas
    p = [p1_p p2_p p3_p];  
    
    d1=sqrt((p2_p(:, 1)-p1_p(:, 1)).^2+(p2_p(:, 2)-p1_p(:, 2)).^2); % Distancia desde el nodo 1 al 2 
    d2=sqrt((p3_p(:, 1)-p2_p(:, 1)).^2+(p3_p(:, 2)-p2_p(:, 2)).^2); % Distancia desde el nodo 2 al 3 
    d3=sqrt((p3_p(:, 1)-p1_p(:, 1)).^2+(p3_p(:, 2)-p1_p(:, 2)).^2); % Distancia desde el nodo al 
   
    mesh.area = [d1 d2 d3] ;
    
    %% Centroides
    %x_centroid = mean([p(:,1),p(:,3), p(:,5)]')';
    %y_centroid = mean([p(:,2),p(:,4), p(:,6)]')';
    
    mesh.centroids = [mean([p(:,1),p(:,3), p(:,5)]')' mean([p(:,2),p(:,4), p(:,6)]')'] ;

    %% Volume
    s = (d1(:)+d2(:)+d3(:))./2; %Semiperimetro
    mesh.volumen = sqrt(s.*(s-d1).*(s-d2).*(s-d3)); %Fórmula de Herón
    
    

    %% Centroides de caras: 
    % mesh.faceCentroids = ;
    
    mesh.nodes(mesh.cells(:,1), 1) % Coordenada X de todos los P1 de todas las celdas
    mesh.nodes(mesh.cells(:,1), 2) % Coordenada Y de todos los P1 de todas las celdas
    mesh.nodes(mesh.cells(:,2), 1) % Coordenada X de todos los P2 de todas las celdas
    mesh.nodes(mesh.cells(:,2), 2) % Coordenada Y de todos los P2 de todas las celdas
    mesh.nodes(mesh.cells(:,3), 1) % Coordenada X de todos los P3 de todas las celdas
    mesh.nodes(mesh.cells(:,3), 2) % Coordenada Y de todos los P3 de todas las celdas
    
    Xf1 = (mesh.nodes(mesh.cells(:,1), 1) + mesh.nodes(mesh.cells(:,2), 1))/2; 
    % Con eso consigo la coordenada X de la cara 1 de todas las celdas
    Yf1 = (mesh.nodes(mesh.cells(:,1), 2) + mesh.nodes(mesh.cells(:,2), 2))/2; 
    % Con eso consigo la coordenada Y de la cara 1 de todas las celdas

    Xf2 = (mesh.nodes(mesh.cells(:,2), 1) + mesh.nodes(mesh.cells(:,3), 1))/2; 
    % Con eso consigo la coordenada X de la cara 2 de todas las celdas
    Yf2 = (mesh.nodes(mesh.cells(:,2), 2) + mesh.nodes(mesh.cells(:,3), 2))/2; 
    % Con eso consigo la coordenada Y de la cara 2 de todas las celdas

    Xf3 = (mesh.nodes(mesh.cells(:,1), 1) + mesh.nodes(mesh.cells(:,3), 1))/2; 
    % Con eso consigo la coordenada X de la cara 3 de todas las celdas
    Yf3 = (mesh.nodes(mesh.cells(:,1), 2) + mesh.nodes(mesh.cells(:,3), 2))/2; 
    % Con eso consigo la coordenada Y de la cara 3 de todas las celdas

    mesh.faceCentroids = [Xf1 Yf1; Xf2 Yf2; Xf3 Yf3];
    mesh.faceCentroids_2 = [Xf1 Yf1 Xf2 Yf2 Xf3 Yf3];
    % Dicha malla tendra dimensiones [3*N, 2], y tendra la siguiente
    % estructura:
    % [Xcara1 Ycara1; Xcara2 Ycara2; ...; XcaraP YcaraP;] siendo P = 3*N
    
    %% Conectividad
    mesh.vecinos = zeros(N_elements, 3);
    for i = 1:length(mesh.cells) % Recorremos todas las celdas 
        for j = 1:3              % Recorremos las caras de cada celda
            % Comprobamos si el centroide de la cara j
            %row = mesh.faceCentroids_2 == mesh.faceCentroids_2(i, j) & mesh.faceCentroids_2 == mesh.faceCentroids_2(i, 2*j)
            %row = ismember(mesh.faceCentroids, [mesh.faceCentroids(i*j, 1), mesh.faceCentroids(i*j, 2)]);
            %% EL ERROR ESTA EN ROW AUX, QUE NO INDEXO BIEN AL FINAL
            row_aux = ismember(mesh.faceCentroids_2, [mesh.faceCentroids_2(i, 2*j - 1), mesh.faceCentroids_2(i, 2*j)]);
            %row_aux = 
            row_aux_2 = [and(row_aux(:,1), row_aux(:,2)) and(row_aux(:,3), row_aux(:,4))  and(row_aux(:,5), row_aux(:,6)) ];
            % row_aux = ismember(mesh.faceCentroids, [mesh.faceCentroids(i,j), mesh.faceCentroids(i,2*j)]);
            %row = mesh.faceCentroids == mesh.faceCentroids(i*j,1) & mesh.faceCentroids == mesh.faceCentroids(i*j,2);
            %row2 = row(:,1) == 1 & row(:,2) == 1;
            %row2_aux = row(:,1) == 1 & row(:,2) == 1;
            [row_aux_3, col] = find(row_aux_2 == 1);
            
            for k = 1:length(row_aux_3)
                if row_aux_3(k) ~= i % Si es una celda diferente a la que estamos
                    mesh.vecinos(i, j) = row_aux_3(k);
                end
            end       
        end
    end
    
%% Comentarios
% Creo que el fallo esta en el calculo de los centroides de los lados...
%



    %% Normal exterior


end