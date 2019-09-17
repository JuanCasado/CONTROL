A = [0  2 10  7 90;
     2  7  7  1 59;
     1  9  0  5 15;
     4  0  0  6 10;
     2  8  4  1 80;
     10 5  0  3 17;
     2  6  4  0 93;
     1  1  9  3 51;
     6  4  8  2 41;
     0  3  0  9 76];
B = [0.110 0 1 0 317;
     0 3.260 0 1 237;
     0.425 0 1 0 319;
     0 3.574 0 1 239;
     0.739 0 1 0 321;
     0 3.888 0 1 241;
     1.054 0 1 0 323;
     0 4.202 0 1 243;
     1.368 0 1 0 325;
     0 4.516 0 1 245];
 
 %Número de condición
 condicion = norm(pinv(A))*norm(A);
 display(condicion)
 
 %{
 ----------------------------MIRAR-----------------------------------------
 Otra forma de obtener el numero condicion es con cond, aunque da el mismo
 valor
 https://w3.ual.es/~andrei/Practicas/practica7.pdf -> Punto 2.2
 
 condi = cond(A);
 display(condi)
 ----------------------------MIRAR-----------------------------------------
 %}
 
 
 %Calcular la solución del sistema
 sol = linsolve(A, B);
 display(sol)
 
 %Meter ruido a la matriz y calcular la solución del sistema
 len = size(B);
 noise = randn(len(1),1);
 %{
 ----------------------------MIRAR-----------------------------------------
 Esta linea la has escrito tu, en vez de quitar las ultimas dos columnas de
 la matriz hay que quitar solo la columna final (la del resultado) por eso
 hay que restar 1
 B_noise = [B(:,1:len(2)-2) (B(:,len(2))+noise)];
 ----------------------------MIRAR-----------------------------------------
 %}
 B_noise = [B(:,1:len(2)-1) (B(:,len(2))+noise)];
 sol_noise = linsolve(A, B_noise);
 display(sol_noise)