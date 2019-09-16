
len = 25;
t_det = [];
t_rank = [];
for i = 1:len
    matriz = rand(i);
    tic
    det(matriz)
    t_det(i) = toc;
    tic
    rank(matriz)
    t_rank(i) = toc;
end

figure('Name', 'Tiempos')
hold on
plot(1:len, t_det)
plot(1:len, t_rank)
xlabel('Tamaño')
ylabel('Tiempo')
legend('det', 'rank')
title('Tiempos')
hold off