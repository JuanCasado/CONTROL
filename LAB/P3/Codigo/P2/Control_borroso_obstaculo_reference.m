%Tiempo de muestreo
Ts=100e-3;
error_margin = 0.05;
w0 = pi/2;
x0 = 0;
y0 = 0;
 
% Referencia x-y de posicion
refx=-4;
refy=-4;
<<<<<<< HEAD
obsx=-2.25;
obsy= 2;
% Ejecutar Simulacion
fis_name = 'Control_borroso_gaussianas_obs.fis';
=======
obsx=3;
obsy=3;

%%
% PRUEBAS REALIZADAS PARA EL DOCUMENTO
% Prueba 1
% 
% w0 = 0;
% x0 = 0;
% y0 = 0;
% refx=6;
% refy=0;
% obsx=3;
% obsy=0;
% 
% 
% Prueba 2
% 
% w0 = pi/2;
% x0 = 0;
% y0 = 0;
% refx=-4;
% refy=-4;
% obsx=-4;
% obsy=0;
% 
% 
% Prueba 3
% 
% w0 = -2*pi/4;
% x0 = 0;
% y0 = 0;
% refx=4;
% refy=-6;
% obsx=1;
% obsy=-2;
% 
% 
% Prueba 4
% 
% 
% w0 = pi/2;
% x0 = 0;
% y0 = 0;
% refx=-4;
% refy=-4;
% obsx=-2.25;
% obsy=2;
%%

% Ejecutar Simulacion
fis_name = 'Control_borroso_rapido_obs.fis';
>>>>>>> d7b850648046e7a212630207793c1e723f9e6648
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
