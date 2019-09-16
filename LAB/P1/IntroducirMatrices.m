%Crea una matriz de las dimensiones indicadas
%Si se introduce un vector la matrz resultado será de simensiones [filas columnas]
%Se se introduce un numero la matriz será cuadrada de ses tamaño
%Si de introduce 'r' como valor de una posición el resto de valores a partir de ese punto serán introducidos de forma aleatoria
function Matriz = IntroducirMatrices (Dimensiones)
len = size(Dimensiones);
if len(2) >= 2
    rows = Dimensiones(1);
    cols = Dimensiones(2);
else
    rows = Dimensiones;
    cols = Dimensiones;
end
Matriz = [];
random = 0;
    for i = 1:rows
        for j = 1:cols
            if random
                value = rand();
            else
                value = input(sprintf('Introduce valor [ %d, %d]: ',i,j));
                if value == 'r'
                    value = rand();
                    random = 1;
                end
            end
            Matriz(i,j) = value;
        end
    end  
end