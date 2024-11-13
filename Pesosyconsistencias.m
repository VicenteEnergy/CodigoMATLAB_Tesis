function ahp_consistency_check_all(matrices)
    % Verificar que la entrada sea una celda de matrices
    if ~iscell(matrices)
        error('La entrada debe ser una celda de matrices.');
    end
    
    % Inicializar variables para almacenar pesos de criterios y alternativas
    num_criterios = length(matrices) - 1; % Resto uno porque la primera matriz es de criterios
    criterios_pesos = [];
    alternativas_pesos = cell(1, num_criterios); % Guardar pesos de alternativas para cada criterio
    
    % Evaluar cada matriz en la celda
    for i = 1:length(matrices)
        matrix = matrices{i};
        
        % Verificar que cada matriz sea cuadrada
        [n, m] = size(matrix);
        if n ~= m
            fprintf('Matriz %d no es cuadrada, se omite.\n', i);
            continue;
        end
        
        % Mostrar la matriz original
        fprintf('\nMatriz %d:\n', i);
        disp(matrix);
        
        % Calcular autovalores y autovector principal
        [V, D] = eig(matrix);
        max_eigenvalue = max(real(diag(D)));
        principal_eigenvector = V(:, real(diag(D)) == max_eigenvalue);
        
        % Normalizar el vector de pesos
        weights = real(principal_eigenvector / sum(principal_eigenvector));
        
        % Guardar pesos en la variable correspondiente
        if i == 1
            criterios_pesos = weights; % Guardar pesos de criterios
        else
            alternativas_pesos{i - 1} = weights; % Guardar pesos de alternativas bajo cada criterio
        end
        
        % Calcular el índice de consistencia (CI)
        CI = (max_eigenvalue - n) / (n - 1);
        
        % Obtener el índice de consistencia aleatoria (RI) según el tamaño de la matriz
        RI_values = [0 0 0.58 0.9 1.12 1.24 1.32 1.41 1.45 1.49];
        if n <= length(RI_values)
            RI = RI_values(n);
        else
            fprintf('No hay un valor de RI para matrices de tamaño %d, matriz %d se omite.\n', n, i);
            continue;
        end
        
        % Calcular el ratio de consistencia (CR)
        CR = CI / RI;
        
        % Determinar si la matriz es consistente o no
        is_consistent = CR < 0.1;
        
        % Mostrar resultados para cada matriz en la Command Window
        fprintf('Pesos de la Matriz %d:\n', i);
        disp(weights);
        fprintf('Índice de consistencia (CI) de la Matriz %d: %.4f\n', i, CI);
        fprintf('Ratio de consistencia (CR) de la Matriz %d: %.4f\n', i, CR);
        if is_consistent
            fprintf('La Matriz %d es consistente.\n', i);
        else
            fprintf('La Matriz %d no es consistente.\n', i);
        end
    end
    
    % Calcular y mostrar puntaje final de cada alternativa
    num_alternativas = length(alternativas_pesos{1});
    puntajes_finales = zeros(1, num_alternativas);
    fprintf('\nPuntajes finales de cada alternativa:\n');
    
    for j = 1:num_alternativas
        % Sumar los productos de pesos de criterios y pesos de alternativas bajo cada criterio
        for k = 1:num_criterios
            puntajes_finales(j) = puntajes_finales(j) + criterios_pesos(k) * alternativas_pesos{k}(j);
        end
        fprintf('Alternativa %d: %.4f\n', j, puntajes_finales(j));
    end
    
    % Determinar la mejor alternativa
    [max_puntaje, mejor_alternativa] = max(puntajes_finales);
    fprintf('\nLa mejor alternativa es la Alternativa %d con un puntaje de %.4f\n', mejor_alternativa, max_puntaje);
end

% Matriz de comparación de criterios
criteria_comparison = [
    1        1        0.25      1        0.5;
    1        1        0.25      1        0.5;
    4        4        1        4        3;
    1        1        0.25      1        0.5;
    2        2        0.33333  2        1
];

% Matrices de comparación de alternativas bajo cada criterio
alternative_comparisons = {
    % Bajo criterio Económico
    [
        1        0.5  0.5        1;
        2        1        2        2;
        2        0.5        1        2;
        1        0.5  0.5        1
    ], 
    % Bajo criterio Ambiental
    [
        1        0.33333  1        1;
        3        1        1        3;
        1        1        1        1;
        1        0.33333  1        1
    ], 
    % Bajo criterio Técnico
    [
        1        0.33333  1        1;
        3        1        1        3;
        1        1        1        1;
        1        0.33333  1        1
    ], 
    % Bajo criterio Político
    [
        1        0.33333  1        1;
        3        1        1        3;
        1        1        1        1;
        1        0.33333  1        1
    ], 
    % Bajo criterio Social
    [
        1        0.33333  1        1;
        3        1        1        3;
        1        1        1        1;
        1        0.33333  1        1
    ]
};

% Unir todas las matrices en una celda para evaluarlas todas
matrices = {criteria_comparison, alternative_comparisons{:}};

% Llamar a la función para evaluar todas las matrices
ahp_consistency_check_all(matrices);
