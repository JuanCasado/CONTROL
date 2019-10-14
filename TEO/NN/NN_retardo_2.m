% Load the data
y = laser_dataset;
y = y(1:600);
% Arrange inputs and targets for training a one-step-ahead predictor 
p = y(9:end);
t = y(9:end);
Pi=y(1:8);
% Linear Dynamic Neural Network (LDNN)
lin_net = linearlayer([1:8],10); 
lin_net.trainFcn='trainlm'; 
%lin_net.trainParam.epochs = 1000; 
%lin_net.divideFcn = '';
[lin_net,tr] = train(lin_net,p,t,Pi); 
% Simulate the network
lin_yp = lin_net(p,Pi);
% Calculate the prediction error
lin_e = gsubtract(lin_yp,t);
lin_rmse = sqrt(mse(lin_e)) % lin_rmse = 21.1386
figure(1); 
plotresponse(t,lin_yp); 
title('LDNN');
