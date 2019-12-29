rosshutdown
controller_name = 'controlador_sugeno.fis';

Ts=100e-3;
vel = 1;
offset_0 = -1.6000;
offset_1 = -0.1000;
offset_2 =  -0.2600;
arround_th = 0.01;

saturation1_high = 0.17;
saturation1_low = -0.0100;
saturation2_high = 0.05;
saturation2_low = -0.05;
saturation3_high = 0.09;
saturation3_low = -0.09;

% Ejecutar Simulacion
sim('controlador_sugeno.slx')
