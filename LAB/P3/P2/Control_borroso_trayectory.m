%Tiempo de muestreo
Ts=100e-3;
w0 = 0;
x0 = 0;
y0 = 0;
x_0 = x0;
y_0 = y0;
th_0 = w0;
obsx=3;
obsy=0;

% Ejecutar Simulacion
%fis_name = 'Control_borroso_oscilaciones.fis';
%fis_name = 'Control_borroso_gausianas.fis';
fis_name = 'Control_borroso_obstaculo_reglas.fis';

sim('PositionControl_trayectory.slx') 
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
grid on
hold off
