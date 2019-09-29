rango = [0 20];
a = 1;

%Parte 1
syms f1(k);
f1(k) = 2 + 5*k + k^2;
transf1 = ztrans(f1);
figure("Name","Grafica 1")
hold on
fplot(f1,rango)
fplot(transf1,rango)
legend(["Funcion original","Funcion transformada"])
hold off


%Parte 2
syms f2(k);
f2(k)=sin(k)*exp(-a*k);
transf2 = ztrans(f2);
figure("Name","Grafica 2")
hold on
fplot(f2,rango)
fplot(transf2,rango)
legend(["Funcion original","Funcion transformada"])
hold off

%Parte 3
numerador = [0.4 0 0]; %0.4*z^2
denominador = [1 -1 0.1 0.02];%z^3-z^2+0.1*z+0.02
ts = 0.2;
funcionTransferencia = tf(numerador,denominador,ts);
[yImpulso, tImpulso] = impulse(funcionTransferencia);
[yEscalon, tEscalon]= step(funcionTransferencia);
figure("Name","Grafica 3")
hold on
plot(yImpulso,tImpulso)
plot(yEscalon, tEscalon)
legend(["Respuesta impulso","Respuesta escalon"])
hold off