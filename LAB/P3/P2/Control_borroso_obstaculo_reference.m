%Tiempo de muestreo
Ts=100e-3;
error_margin = 0.02;
x0 = 0;
y0 = 0;
w0 = pi;

% Referencia x-y de posicion
refx=0;
refy=5;

%Obstaculo posicion
obsx=-0.85;
obsy=0.14;

% Ejecutar Simulacion
fis_name = 'Control_borroso_obstaculo_reglas_2.fis';
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
