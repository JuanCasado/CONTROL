A = IntroducirMatrices(input('Indique las dimensiones de la matriz A: '));
B = IntroducirMatrices(input('Indique las dimensiones de la matriz B: '));
display(A)
display(B)

lenA = size(A);
lenB = size(B);

%Transpuestas
A_t = transpose(A);
B_t = transpose(B);
display(A_t)
display(B_t)

%Comprobamos si las matreices son cuadradas, de no serlo se calcula pinv
if lenA(1)==lenA(2) 
    %Inversa A
    A_i = inv(A);
    display(A_i)
    %Determinante A
    A_d = det(A);
    display(A_d)
else
    display('La matriz A no es cuadrada, no se puede calcular ni el determinante ni la inversa')
    A_p = pinv(A);
    display(A_p)
end
if lenB(1)==lenB(2)
    %Inversa B
    B_i = inv(B);
    display(B_i)
    %Determinante B
    B_d = det(B);
    display(B_d)
else
    display('La matriz B no es cuadrada, no se puede calcular ni el determinante ni la inversa')
    B_p = pinv(B);
    display(B_p)
end

%Rango
A_r = rank(A);
B_r = rank(B);
display(A_r)
display(B_r)

%Producto valor a valor
multiplied = [];
if lenA(2) == lenB(1)
    for i = 1:lenA(1)
        for j = 1:lenB(2)
            acc = 0;
            for c = 1:lenA(2)
                acc = acc + A(i,c)*B(c,j);
            end
            multiplied(i,j) = acc;
        end
    end
    display(multiplied)
else
    display('Las matrices no pueden multiplicarse elemento a elemento')
end

if lenA(2) == lenB(1)
    multElemToElem = A*B;
    display(multElemToElem)
else
    display('Las matrices no pueden multiplicarse matricialmente')
end

%Vector fila con la primera fila de cada matriz
v_fila = [A(1,:) B(1,:)];
display(v_fila)

%Vector columnas con la primera columna de cada matriz
v_columna = [A(:,1); B(:,1)];
display(v_columna)
