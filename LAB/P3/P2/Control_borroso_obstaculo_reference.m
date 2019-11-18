%Tiempo de muestreo
Ts=100e-3;
error_margin = 0.02;
w0 = 0;
x0 = 0;
y0 = 0;

% Referencia x-y de posicion
refx=-7;
refy=0;
obsx=-3;
obsy=-6;
% Ejecutar Simulacion
fis_name = 'Control_borroso_obstaculo_reglas.fis';
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
