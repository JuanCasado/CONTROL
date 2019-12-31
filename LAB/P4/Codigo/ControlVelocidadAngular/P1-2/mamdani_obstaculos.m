
rosshutdown
controller_name = 'controlador_mamdani_obstaculos.fis';
Ts=100e-3;
vel = 1;
offset_0 = -0.2;         %Sonar0-Sonar5
offset_1 = -0.22;        %Sonar1-Sonar7
offset_2 =  -0.18;       %Sonar4-Sonar6
offset_obs1 =  1.82;     %Sonar2-Sonar3
offset_obs2 =  -0.06;    %Sonar1-Sonar4
arround_th = 0.01;

% Ejecutar Simulacion
sim('controlador_mamdani_obstaculos.slx')


%% Mostrar
out=post_format.signals.values;
x=x.signals.values;
y=y.signals.values;
figure("Name", "Angular Velocity");plot(out)
len = min(size(x,1), size(y,1));
figure("Name", "Trajectory");plot(x(1:len),y(1:len))

%% errors
e_sonar0 = e_sonar0.signals.values;
e_sonar1 = e_sonar1.signals.values;
e_sonar2 = e_sonar2.signals.values;
e_sonar_obs0 = e_sonar_obs0.signals.values;
e_sonar_obs1 = e_sonar_obs1.signals.values;
out = post_format.signals.values;

figure("Name", "e_sonar0");plot(e_sonar0);
figure("Name", "e_sonar1");plot(e_sonar1);
figure("Name", "e_sonar2");plot(e_sonar2);
figure("Name", "e_sonar_obs0");plot(e_sonar_obs0);
figure("Name", "e_sonar_obs1");plot(e_sonar_obs1);

%% Sonars
e_sonar0_ = e_sonar0.signals.values;
e_sonar1_ = e_sonar1.signals.values;
e_sonar2_ = e_sonar2.signals.values;
e_sonar_obs0_ = e_sonar_obs0.signals.values;
e_sonar_obs1_ = e_sonar_obs1.signals.values;
out_ = post_format.signals.values;

e_sonar0_(isinf(e_sonar0_)) = 5.0;
e_sonar1_(isinf(e_sonar1_)) = 5.0;
e_sonar2_(isinf(e_sonar2_)) = 5.0;
e_sonar_obs0_(isinf(e_sonar_obs0_)) = 5.0;
e_sonar_obs1_(isinf(e_sonar_obs1_)) = 5.0;

all_data = [e_sonar0_ e_sonar1_ e_sonar2_ e_sonar_obs0_ e_sonar_obs1_ out_];
all_data = double(all_data);

save all_dataTrain.dat all_data -ascii 

