A1 = [0  2 10  7;
     2  7  7  1;
     1  9  0  5;
     4  0  0  6;
     2  8  4  1;
     10 5  0  3;
     2  6  4  0;
     1  1  9  3;
     6  4  8  2;
     0  3  0  9];
 
 B1 = [90;59;15;10;80;17;93;51;41;76];

A2 = [0.110 0 1 0;
     0 3.260 0 1;
     0.425 0 1 0;
     0 3.574 0 1;
     0.739 0 1 0;
     0 3.888 0 1;
     1.054 0 1 0;
     0 4.202 0 1;
     1.368 0 1 0;
     0 4.516 0 1];
 B2 = [317;237;319;239;321;241;323;243;325;245];
 
 %Número de condición
 condicionA1 = cond(A1);
 display(condicionA1)
 condicionA2 = cond(A2);
 display(condicionA2)
 
 %Calcular la solución del sistema
 sol1 = linsolve(A1, B1);
 display(sol1)
 sol2 = linsolve(A2, B2);
 display(sol2)
 
 %Meter ruido a la matriz y calcular la solución del sistema
 len = size(B1);
 noise = randn(len(1),1);
 
 sol_noise1 = linsolve(A1, B1+noise);
 display(sol_noise1)
 sol_noise2 = linsolve(A2, B2+noise);
 display(sol_noise2)
 
 error1 = ((sol1 - sol_noise1).^2).^(1/2);
 display(error1)
 error2 = ((sol2 - sol_noise2).^2).^(1/2);
 display(error2)
 
 figure("Name", "Diferencia entre los resultados de linsolve con y sin error")
 hold on
 plot(error1)
 plot(error2)
 legend(["error matriz 1","error matriz 2"])
 xlabel("X")
 ylabel("diferencia entre resultados")
 title("Diferencia entre los resultados de linsolve con y sin error")
 hold off