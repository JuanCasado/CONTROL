
%Crear una matriz A y un vector columna v
A = [1 2; 3 4; 5 6; 7 8];
v = [14; 16; 18; 20];

%Mostramos los elementos creados
%disp(A)
%disp(v)

%Matriz concatenada de A y v
B = [A v];
disp (B)

%Vector fila de la matriz B concatenando sus filas
vector_fila = [];
len_B = size(B);
for i = 1:len_B(1)
    vector_fila = [vector_fila B(i,:)];
end
display(vector_fila)

%Vector fila de la matriz B concatenando sus filas
vector_columna = [];
len_B = size(B);
for i = 1:len_B(2)
    vector_columna = [vector_columna; B(:,i)];
end
display(vector_columna)
