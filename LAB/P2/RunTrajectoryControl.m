
Ts = 100e-3;
th_0 = 30*pi/180;
x_0 = 0;
y_0 = 0;


sim('Trajectory_generator.slx')
sim('PositionControlNARX.slx')

figure('Name', 'trayectoria a seguir')
plot(x_out.signals.values, y_out.signals.values)
figure('Name', 'trayectoria realizada')
plot(salida_x.signals.values, salida_y.signals.values)
