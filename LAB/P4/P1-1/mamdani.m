
rosshutdown
clear all
controller_name = 'controlador_mamdani.fis';
Ts=100e-3;
vel = 1;
offset_0 = -1.6000;
offset_1 = -0.1000;
offset_2 =  -0.2600;
arround_th = 0.01;

% Ejecutar Simulacion
sim('controlador_mamdani.slx') 

%%
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

%% Sonars
sonar0_ = sonar0.signals.values;
sonar1_ = sonar1.signals.values;
sonar2_ = sonar2.signals.values;
sonar3_ = sonar3.signals.values;
sonar4_ = sonar4.signals.values;
sonar5_ = sonar5.signals.values;
sonar6_ = sonar6.signals.values;
sonar7_ = sonar7.signals.values;
out=post_format.signals.values;

sonar0_(isinf(sonar0_)) = 5.0;
sonar1_(isinf(sonar1_)) = 5.0;
sonar2_(isinf(sonar2_)) = 5.0;
sonar3_(isinf(sonar3_)) = 5.0;
sonar4_(isinf(sonar4_)) = 5.0;
sonar5_(isinf(sonar5_)) = 5.0;
sonar6_(isinf(sonar6_)) = 5.0;
sonar7_(isinf(sonar7_)) = 5.0;

e_sonar0_ = sonar0_ - sonar5_;
e_sonar1_ = sonar1_ - sonar7_;
e_sonar2_ = sonar4_ - sonar6_;

train = [e_sonar0_ e_sonar1_ e_sonar2_ out];
train = double(train);


%%
save train.dat train -ascii