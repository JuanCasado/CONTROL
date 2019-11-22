%Tiempo de muestreo
Ts=100e-3;
w0 = 0;
x0 = 0;
y0 = 0;
x_0 = 2;
y_0 = 2;
th_0 = 0;

obsx=3;
obsy=0;

% Ejecutar Simulacion
fis_name = 'Control_borroso_obstaculo_reglas_trayectoria.fis';

sim('PositionControl_trayectory_obs.slx') 
% Mostrar
x=salida_x.signals.values;
y=salida_y.signals.values;
x_ref=x_out.signals.values;
y_ref=y_out.signals.values;

figure
hold on
axis([-10 10 -10 10])
plot(x,y, '-b')
plot(x_ref, y_ref, '-r')
plot(x_0,y_0, 'ob')
plot(x0,y0, 'or')
plot(obsx,obsy, 'og')
grid on
hold off
