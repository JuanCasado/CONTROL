
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% APROXIMACIÓN DE FUNCIONES 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all;

% ============================================
% DEFINICIÓN DE LOS VECTORES DE ENTRADA-SALIDA 
% ============================================
t = -3:.1:3; % eje de tiempo
F=sinc(t)+.001*randn(size(t)); % función que se desea aproximar

plot(t,F,'+');
title('Vectores de entrenamiento');
xlabel('Vector de entrada P');
ylabel('Vector Target T');

% ==================
% DISEÑO DE LA RED 
% ==================
hiddenLayerSize = 4;
%1. trainrp
%2. trainlm
%3. trainbr
%4. trainbfg
%5. traincgb
%6. traincgf
%7. traincgp
%8. traingda
%9. traingdm
%10. traingdx
%11. trainoss
%12. trainscg
net = fitnet(hiddenLayerSize,'trainbr');
%Dividir los datos
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;
net = train(net,t,F);
Y=net(t);

plot(t,F,'+');
hold on;
plot(t,Y,'-r');
hold off;

title('Vectores de entrenamiento'); 
xlabel('Vector de entrada P'); 
ylabel('Vector Target T');