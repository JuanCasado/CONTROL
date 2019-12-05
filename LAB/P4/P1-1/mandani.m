
rosshutdown
clear all
controller_name = 'controlador_mandani_3.fis';
Ts=100e-3;
vel = 1;
offset_0 = -1.6000;
offset_1 = -0.1000;
offset_2 =  -0.2600;
arround_th = 0.01;

% Ejecutar Simulacion
sim('controlador_mandani.slx') 


%% Mostrar
post_format=post_format.signals.values;
figure
hold on
plot(post_format)
grid on
hold off