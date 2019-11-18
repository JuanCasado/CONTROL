
len = 25;
t_det = [];
t_rank = [];
for i = 1:len
    matriz = rand(i);
    tic
    det(matriz)
    %Guardamos el tiempo de calcular el determinante
    t_det(i) = toc;
    tic
    rank(matriz)
    %Guardamos el tiempo de calcular el rango
    t_rank(i) = toc;
end

%Dibujamos una gráfica con los tiempos
figure('Name', 'Tiempos')
hold on
plot(1:len, t_det)
plot(1:len, t_rank)
xlabel('Tamaño')
ylabel('Tiempo')
legend('det', 'rank')
title('Tiempos')
hold off