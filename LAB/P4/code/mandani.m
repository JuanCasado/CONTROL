

controller_name = 'controlador_mandani_3.fis';
Ts=100e-3;
vel = 1;
offset_0 = -1.6000;
offset_1 = -2.1600;
offset_2 =  1.8000;
arround_th = 0.1;

% Ejecutar Simulacion
sim('controlador_mandani.slx') 


%% Mostrar
pre_format=pre_format.signals.values;
post_format=post_format.signals.values;
%%
figure
hold on
plot(pre_format)
plot(post_format)
grid on
hold off