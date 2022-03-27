function mesh = mesh_processor(N_elements)
    cells = strcat('cells_',num2str(N_elements),'.dat');
    nodes  = strcat('nodes_',num2str(N_elements),'.dat');
    
    cells = readtable("files/" + cells);
    mesh.cells = table2array(cells);
    nodes = readtable("files/" + nodes);
    mesh.nodes = table2array(nodes);
    %bc = readtable("files/" + bc);
    %mesh.bc = table2array(bc);

    %% Caras
    
    
    %% Areas
    mesh.area = zeros(N_elements, 1);
    mesh.area(N_elements)

    cell_index = linspace(1,N_elements, N_elements);
        
    p1 = mesh.cells(cell_index, 1);
    p2 = mesh.cells(cell_index, 2);
    p3 = mesh.cells(cell_index, 3);
    p1_p = [mesh.nodes(p1, 1) mesh.nodes(p1, 2)];
    p2_p = [mesh.nodes(p2, 1) mesh.nodes(p2, 2)];
    p3_p = [mesh.nodes(p3, 1) mesh.nodes(p3, 2)];
    p = [p1_p p2_p p3_p];
    
    d1=sqrt((p2_p(:, 1)-p1_p(:, 1)).^2+(p2_p(:, 2)-p1_p(:, 2)).^2); %distancia de A hasta B
    d2=sqrt((p3_p(:, 1)-p1_p(:, 1)).^2+(p3_p(:, 2)-p1_p(:, 2)).^2); %distancia de A hasta C
    d3=sqrt((p3_p(:, 1)-p2_p(:, 1)).^2+(p3_p(:, 2)-p2_p(:, 2)).^2); %distancia de B hasta C

    s = (d1(:)+d2(:)+d3(:))./2; %Semiperimetro
    mesh.area = sqrt(s.*(s-d1).*(s-d2).*(s-d3)); %Fórmula de Herón
    

    %% Centroides
    %x_centroid = mean([p(:,1),p(:,3), p(:,5)]')';
    %y_centroid = mean([p(:,2),p(:,4), p(:,6)]')';
    
    mesh.centroids = [mean([p(:,1),p(:,3), p(:,5)]')' mean([p(:,2),p(:,4), p(:,6)]')'] ;

    %% Volume
    mesh.volume = mesh.area;

    %% Conectividad



end