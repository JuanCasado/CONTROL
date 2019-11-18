%Regularization
[x,t] = simplefit_dataset;
x1=x(1:60); x2=x(61:94); % Data to check overfitting
t1=t(1:60); t2=t(61:94);
net = feedforwardnet(10,'trainbfg');
net.divideFcn = '';
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;
net.performParam.regularization = 0.1;
net = train(net,x,t);
y=sim(net,x);
e = gsubtract(y,t);
rmse = sqrt(mse(e))
% The problem with regularization is that it is difficult to determine the % optimum value for the performance ratio parameter