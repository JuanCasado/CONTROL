
% Carga de datos de ejemplo disponibles en la toolbox
% bodyfat_dataset
% simplefit_dataset
[inputs,targets] = bodyfat_dataset;
% Creación de la red
hiddenLayerSize = 10;
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
net = fitnet(hiddenLayerSize, 'trainscg');
% División del conjunto de datos para entrenamiento, validación y test
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;
% Entrenamiento de la red
[net,tr] = train(net,inputs,targets);
% Prueba
outputs = net(inputs);
errors = gsubtract(outputs,targets);
performance = perform(net,targets,outputs)
% Visualización de la red
%view(net)
