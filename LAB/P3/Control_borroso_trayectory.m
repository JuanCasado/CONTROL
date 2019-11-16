%Tiempo de muestreo
Ts=100e-3;
w0 = 0;
x0 = 0;
y0 = 0;
x_0 = x0;
y_0 = y0;
th_0 = w0;

% Ejecutar Simulacion
<<<<<<< HEAD
fis_name = 'Control_borroso_mejor_giro_con_gaussianas.fis';
=======
fis_name = 'Control_borroso_gausianas.fis';
>>>>>>> 80f9143498b72e5ac0b89486b69d1e1b32a3ebb5
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
