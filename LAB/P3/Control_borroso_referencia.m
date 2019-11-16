%Tiempo de muestreo
Ts=100e-3;
error_margin = 0.02;
w0 = 0;
x0 = 0;
y0 = 0;

% Referencia x-y de posicion
refx=-5;
refy=7;
% Ejecutar Simulacion
fis_name = 'Control_borroso_gausianas.fis';
sim('PositionControl_referencia.slx')
% Mostrar
x=salida_x.signals.values;
y=salida_y.signals.values; 

figure
hold on
axis([-7 7 -7 7])
plot(x,y)
plot(refx,refy, 'ob')
plot(x0,y0, 'or')
grid on
hold off
