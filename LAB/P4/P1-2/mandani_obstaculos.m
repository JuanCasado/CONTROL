
rosshutdown
controller_name = 'controlador_mandani_obstaculos.fis';
Ts=100e-3;
vel = 1;
offset_0 = 0;     %Sonar0-Sonar5
offset_1 = 0;     %Sonar1-Sonar7
offset_2 =  0;    %Sonar4-Sonar6
offset_obs1 =  0; %Sonar2-Sonar3
offset_obs2 =  0; %Sonar1-Sonar4
arround_th = 0.1;

% Ejecutar Simulacion
sim('controlador_mandani_obstaculos.slx') 


%% Mostrar
post_format=post_format.signals.values;
x=x.signals.values;
y=y.signals.values;
figure;plot(post_format)
figure;plot(x,y)


%%
sonar0 = sonar0.signals.values;
sonar1 = sonar1.signals.values;
sonar2 = sonar2.signals.values;
sonar3 = sonar3.signals.values;
sonar4 = sonar4.signals.values;
sonar5 = sonar5.signals.values;
sonar6 = sonar6.signals.values;
sonar7 = sonar7.signals.values;