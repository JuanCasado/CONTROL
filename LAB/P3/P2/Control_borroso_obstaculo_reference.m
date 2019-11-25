%Tiempo de muestreo
Ts=100e-3;
error_margin = 0.05;
w0 = pi/2;
x0 = 0;
y0 = 0;

% Referencia x-y de posicion
refx=-4;
refy=-4;
obsx=-2.25;
obsy= 2;
% Ejecutar Simulacion
fis_name = 'Control_borroso_gaussianas_obs.fis';
sim('PositionControl_referencia_obs.slx')
% Mostrar
x=salida_x.signals.values;
y=salida_y.signals.values; 

figure
hold on
axis([-10 10 -10 10])
plot(x,y)
plot(obsx,obsy,'og')
plot(refx,refy, 'ob')
plot(x0,y0, 'or')
grid on
hold off
