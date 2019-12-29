
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
sonar0_ = sonar0.signals.values;
sonar1_ = sonar1.signals.values;
sonar2_ = sonar2.signals.values;
sonar3_ = sonar3.signals.values;
sonar4_ = sonar4.signals.values;
sonar5_ = sonar5.signals.values;
sonar6_ = sonar6.signals.values;
sonar7_ = sonar7.signals.values;

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
e_sonar_obs0_ = sonar2_ - sonar3_;
e_sonar_obs1_ = sonar1_ - sonar4_;

all_data = [e_sonar0_ e_sonar1_ e_sonar2_ e_sonar_obs0_ e_sonar_obs1_ out];
all_data = double(all_data);

%%

test = [];
train = [];
validation = [];
for i = 1:size(all_data, 1)
    mod_i = mod(i, 100);
    if mod_i < 70
        train = [train; all_data(i,:)];
    elseif mod_i < 85
        test = [test; all_data(i,:)];
    else
        validation = [validation; all_data(i,:)];
    end
end

%%
save test test
save train train
save validation validation

