% Focused Time-Delay Neural Network (FTDNN)
ftdnn_net = timedelaynet([1:8],10); 
ftdnn_net.trainParam.epochs = 1000; 
ftdnn_net.divideFcn = '';
% Simulate the network
ftdnn_net = train(ftdnn_net,p,t,Pi);
% Calculate the prediction error
ftdnn_yp = ftdnn_net(p,Pi);
e = gsubtract(ftdnn_yp,t);
ftdnn_rmse = sqrt(mse(e)) % ftdnn_rmse = 1.1736 
figure(2); 
plotresponse(t,ftdnn_yp); 
title('FTDNN');
% Time Series Distributed Delay Neural Networks (TDNN)
d1 = 0:4;
d2 = 0:3;
% The difference with timedelaynet is the first input argument is a cell array with the tapped delays 
dtdnn_net = distdelaynet({d1,d2},5); 
dtdnn_net.trainFcn = 'trainbr';
dtdnn_net.divideFcn = '';
dtdnn_net.trainParam.epochs = 200;
dtdnn_net = train(dtdnn_net,p,t);
dtdnn_yp = sim(dtdnn_net,p);
e = gsubtract(dtdnn_yp,t);
dtdnn_rmse = sqrt(mse(e)) % dtdnn_rmse = 0.0010 
figure(3); 
plotresponse(t,dtdnn_yp); 
title('TDNN');