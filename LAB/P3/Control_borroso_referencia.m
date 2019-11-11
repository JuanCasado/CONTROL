%Tiempo de muestreo
Ts=100e-3;
error_margin = 0.01;
w0 = 30*pi/180;
x0 = 0;
y0 = 0;
velocidad_fija = 0.1;

% Referencia x-y de posicion
refx=5;
refy=5;
% Ejecutar Simulacion 
sim('PositionControl.slx') 
% Mostrar
x=salida_x.signals.values;
y=salida_y.signals.values; 

figure
hold on
plot(x,y)
plot(refx,refy, 'ob')
plot(x0,y0, 'or')
grid on
hold off
