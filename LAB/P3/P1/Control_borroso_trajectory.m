%Tiempo de muestreo
Ts=100e-3;
error_margin = 0.01;
w0 = 0;
x0 = 0;
y0 = -1;
x_0 = 2;
y_0 = 1;
th_0 = pi;

% Ejecutar Simulacion
fis_name = 'Control_borroso.fis';

sim('PositionControl_trajectory.slx') 
% Mostrar
x=salida_x.signals.values;
y=salida_y.signals.values;
x_ref=xref.signals.values;
y_ref=yref.signals.values;

figure
hold on
axis([-10 10 -10 10])
plot(x,y, '-b')
plot(x_ref, y_ref, '-r')
plot(x0,y0, 'or')
plot(x_0,y_0, 'oy')
hold off
