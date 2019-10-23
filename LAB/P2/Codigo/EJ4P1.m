
% cancer_dataset
% simpleclass_dataset

% Carga de datos de ejemplo disponibles en la toolbox
[inputs,targets] = cancer_dataset;
% Creción de una red neuronal para el reconocimiento de patrones
hiddenLayerSize = 10;
net = patternnet(hiddenLayerSize);
%1. trainrp
%2. trainbr
%2. trainlm
%4. trainbfg
%5. traincgb
net.trainFcn = 'trainrp'

% División del conjunto de datos para entrenamiento, validación y test
net.divideParam.trainRatio = 30/100;
net.divideParam.valRatio = 20/100;
net.divideParam.testRatio = 50/100;

% Entrenamiento de la red
[net,tr] = train(net,inputs,targets);
% Prueba
outputs = net(inputs);
errors = gsubtract(targets,outputs);
%performance = perform(net,targets,outputs)
% Visualización
view(net)