
rosshutdown
controller_name = 'controlador_mandani_obstaculos.fis';
Ts=100e-3;
vel = 1;
offset_0 = -0.2;         %Sonar0-Sonar5
offset_1 = -0.22;        %Sonar1-Sonar7
offset_2 =  -0.18;       %Sonar4-Sonar6
offset_obs1 =  1.82;     %Sonar2-Sonar3
offset_obs2 =  -0.06;    %Sonar1-Sonar4
arround_th = 0.01;

% Ejecutar Simulacion
sim('controlador_mandani_obstaculos.slx') 


%% Mostrar
post_format=post_format.signals.values;
x=x.signals.values;
y=y.signals.values;
figure("Name", "Angular Velocity");plot(post_format)
len = min(size(x,1), size(y,1));
figure("Name", "Trajectory");plot(x(1:len),y(1:len))

%% errors
e_sonar0 = e_sonar0.signals.values;
e_sonar1 = e_sonar1.signals.values;
e_sonar2 = e_sonar2.signals.values;
e_sonar_obs0 = e_sonar_obs0.signals.values;
e_sonar_obs1 = e_sonar_obs1.signals.values;

figure("Name", "e_sonar0");plot(e_sonar0);
figure("Name", "e_sonar1");plot(e_sonar1);
figure("Name", "e_sonar2");plot(e_sonar2);
figure("Name", "e_sonar_obs0");plot(e_sonar_obs0);
figure("Name", "e_sonar_obs1");plot(e_sonar_obs1);

%% Sonars
sonar0 = sonar0.signals.values;
sonar1 = sonar1.signals.values;
sonar2 = sonar2.signals.values;
sonar3 = sonar3.signals.values;
sonar4 = sonar4.signals.values;
sonar5 = sonar5.signals.values;
sonar6 = sonar6.signals.values;
sonar7 = sonar7.signals.values;

mean(sonar0-sonar5)
mean(sonar1-sonar7)
mean(sonar4-sonar6)
mean(sonar2-sonar3)
mean(sonar1-sonar4)
