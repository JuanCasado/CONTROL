rango = [0 20];
a = 1;

%Parte 1
syms f1(k);
f1(k) = 2 + 5*k + k^2;
transf1 = ztrans(f1);
display(transf1)
figure("Name","Grafica 1")
hold on
fplot(f1,rango)
fplot(transf1,rango)
legend(["Funcion","Funcion transformada"])
hold off


%Parte 2
syms f2(k);
f2(k)=sin(k)*exp(-a*k);
transf2 = ztrans(f2);
display(transf2)
figure("Name","Grafica 2")
hold on
fplot(f2,rango)
fplot(transf2,rango)
legend(["Funcion","Funcion transformada"])
hold off