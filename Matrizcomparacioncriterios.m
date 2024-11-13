% Datos de sentimiento por criterio
sentimientos_economico = [8.40, 8.40, 2.00, 1.80, 4.20, 1.80, 4.20, 1.80];
sentimientos_ambiental = [2.40, 1.60, 2.00, 2.00, 8.40, 3.00, 5.00, 7.80, 2.60, 2.00, 2.00, 8.40, 3.00, 2.60, 2.00,5.00,7.80,5.00,2.00];
sentimientos_tecnico = [2.60, 5.00, 5.00, 5.00,7.80,1.80,5.00,4.20,5.00,4.20,5.00,4.80,5.00,7.80];
sentimientos_politico = [5.00,5.0,2.00,5.00,1.60,2.00,4.80,1.60,5.00];
sentimientos_social = [8.40,2.00,3.00];


% Cálculo de la media geométrica de cada criterio
media_economico = geomean(sentimientos_economico);
media_ambiental = geomean(sentimientos_ambiental);
media_tecnico = geomean(sentimientos_tecnico);
media_politico = geomean(sentimientos_politico);
media_social = geomean(sentimientos_social);

% Mostrar la media geométrica de cada criterio en la Command Window
disp('Media geométrica de cada criterio:');
fprintf('Económico: %.2f\n', media_economico);
fprintf('Ambiental: %.2f\n', media_ambiental);
fprintf('Técnico: %.2f\n', media_tecnico);
fprintf('Político: %.2f\n', media_politico);
fprintf('Social: %.2f\n', media_social);

% Agrupar las medias en un vector para simplificar las comparaciones
medias_criterios = [media_economico, media_ambiental, media_tecnico, media_politico, media_social];
n = length(medias_criterios);

% Inicializar la matriz de comparación de criterios
matriz_comparacion = ones(n, n);  % Inicializar con 1s en la diagonal

% Paso 2: Llenar la matriz de comparación utilizando la escala de Saaty
for i = 1:n
    for j = i+1:n
        % Diferencia relativa entre criterios
        diff = abs(medias_criterios(i) - medias_criterios(j));
        
        % Aplicar la escala de Saaty según la diferencia
        if diff < 0.25
    valor = 1;   % Igual de importantes
elseif diff < 0.75
    valor = 2;   % Muy ligeramente más importante
elseif diff < 1.25
    valor = 3;   % Ligeramente más importante
elseif diff < 1.75
    valor = 4;   % Entre ligeramente y claramente más importante
elseif diff < 2.25
    valor = 5;   % Claramente más importante
elseif diff < 2.75
    valor = 6;   % Entre claramente y mucho más importante
elseif diff < 3.25
    valor = 7;   % Mucho más importante
elseif diff < 4.0
    valor = 8;   % Entre mucho más y extremadamente más importante
else
    valor = 9;   % Extremadamente más importante
end
        
        % Asignar valor en la matriz: si el criterio en la fila es mayor,
        % él recibe el valor, si no, recibe el recíproco
        if medias_criterios(i) > medias_criterios(j)
            matriz_comparacion(i, j) = valor;
            matriz_comparacion(j, i) = 1 / valor;
        else
            matriz_comparacion(i, j) = 1 / valor;
            matriz_comparacion(j, i) = valor;
        end
    end
end


% Mostrar la matriz de comparación en la Command Window
disp('Matriz de comparación de criterios:');
disp(array2table(matriz_comparacion, 'VariableNames', {'Económico', 'Ambiental', 'Técnico', 'Político', 'Social'}, ...
                'RowNames', {'Económico', 'Ambiental', 'Técnico', 'Político', 'Social'}));
