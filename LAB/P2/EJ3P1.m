
% Carga de datos de ejemplo disponibles en la toolbox
% bodyfat_dataset
% simplefit_dataset
[inputs,targets] = bodyfat_dataset;
% Creación de la red
hiddenLayerSize = 10;
net = fitnet(hiddenLayerSize);
% División del conjunto de datos para entrenamiento, validación y test
net.divideParam.trainRatio = 50/100;%70/100;
net.divideParam.valRatio = 25/100;%15/100;
net.divideParam.testRatio = 25/100;%15/100;
% Entrenamiento de la red
[net,tr] = train(net,inputs,targets);
% Prueba
outputs = net(inputs);
errors = gsubtract(outputs,targets);
performance = perform(net,targets,outputs)
% Visualización de la red
view(net)
