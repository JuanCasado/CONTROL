
%Crear una matriz cuadrada aleatoria
len = input("Indique el tamaño de la matriz: ");
matrix = rand (len);
display (matrix)

%Tomar las columnas impares y crear un vector columna con ellas
odd_vector = [];
for i = 1:2:len
    odd_vector = [odd_vector; matrix(:,i)];
end
display(odd_vector)

%Vector con los elementos diagonales
diagonal_vector = diag(matrix);
display (diagonal_vector)

max_vector = [];
min_vector = [];
avg_vector = [];
var_vector = [];
for i = 1:len
    max_vector = [max_vector max(matrix(i,:))];
    min_vector = [min_vector min(matrix(i,:))];
    avg_vector = [avg_vector mean(matrix(i,:))];
    var_vector = [var_vector var(matrix(i,:))];
end

figure('Name', 'Grafica')
hold on
plot(1:len, max_vector)
plot(1:len, min_vector)
plot(1:len, avg_vector)
plot(1:len, var_vector)
xlabel('Filas')
ylabel('Valores')
legend('max', 'min', 'avg', 'var')
title('PLOT')
hold off