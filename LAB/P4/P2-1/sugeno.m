
rosshutdown
controller_name = 'controlador_sugeno.fis';

Ts=100e-3;
vel = 1;
offset_0 = -1.6000;
offset_1 = -0.1000;
offset_2 =  -0.2600;
arround_th = 0.01;

% Ejecutar Simulacion
sim('controlador_sugeno.slx')

%% Mostrar
x_=x.signals.values;
y_=y.signals.values;
out_ = post_format.signals.values;
figure("Name", "Angular Velocity");plot(out_)
len = min(size(x_,1), size(y_,1));
figure("Name", "Trajectory");plot(x_(1:len),y_(1:len))

%% errors
e_sonar0_ = e_sonar0.signals.values;
e_sonar1_ = e_sonar1.signals.values;
e_sonar2_ = e_sonar2.signals.values;

figure("Name", "e_sonar0");plot(e_sonar0_);
figure("Name", "e_sonar1");plot(e_sonar1_);
figure("Name", "e_sonar2");plot(e_sonar2_);
