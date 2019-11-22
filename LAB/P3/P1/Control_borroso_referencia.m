%Tiempo de muestreo
Ts=100e-3;
error_margin = 0.02;
x0 = 0;
y0 = 0;
w0 = 0;

% Referencia x-y de posicion
refx= -5;
refy= 0;
% Ejecutar Simulacion
fis_name = 'Control_borroso.fis';
sim('PositionControl_referencia.slx')
% Mostrar
x=salida_x.signals.values;
y=salida_y.signals.values; 

figure
hold on
axis([-10 10 -10 10])
plot(x,y)
plot(refx,refy, 'ob')
plot(x0,y0, 'or')
grid on
hold off
