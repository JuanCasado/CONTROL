% Batch Training of ADALINE Log-Sigmoid (Static Network) 
% Concurrent inputs and targets:
p = [[2;2] [1;-2] [-2;2] [-1;1]];
t = [4 5 6 7];
net = linearlayer(0,0.01);
net = configure(net,p,t); net.IW{1,1} = [0 0];
net.b{1} = 0; net.layers{1}.transferFcn = 'logsig';
net.trainParam.epochs = 100;
% train the network in batch mode
t1=t/max(t); % Normalization process
net = train(net,p,t1); %train is used for batch training 
a1 = sim(net,p);
a=a1*max(t) % Desnormalization process
e = a-t
% a = 4.0506 3.7104 5.8037 5.2982
% e = 0.0506 -1.2896 -0.1963 -1.7018
