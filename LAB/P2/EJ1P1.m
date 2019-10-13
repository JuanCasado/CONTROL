
%Creamos el perceptrón
net = perceptron;

%Entradas y salidas esperadas para dichas entradas
p = [0.1 0.7 0.8 0.8 1.0 0.3 0.0 -0.3 -0.5 -1.5  0.0;
     1.2 1.8 1.6 0.6 0.8 0.5 0.2  0.8 -1.5 -1.3 -1.5];
t = [0 0 0 0 0 1 1 1 1 1 1;
     1 1 1 0 0 1 1 1 0 0 1];
 
%Crear la red
net = configure(net,p,t);

%Entrenar la red
[net,a,e,pf] = train(net,p,t);

%Ver los resultados
figure
plotpv(p, t)
plotpc(net.iw{1,1}, net.b{1})
view(net)
