% Batch Training of ADALINE (Static Network) % Concurrent inputs and targets:
p = [[2;2] [1;-2] [-2;2] [-1;1]];
t = [4 5 6 7];
% Cells data can be used too (sequential data) 
%p = {[2;2] [1;-2] [-2;2] [-1;1]};
%t = {4 5 6 7};
net = linearlayer(0,0.01);
net = configure(net,p,t);
net.IW{1,1} = [0 0];
net.b{1} = 0;
net.trainParam.epochs = 100;
% train the network in batch mode
net = train(net,p,t); %train is used for batch training 
a = sim(net,p)
e = a-t
% a = 4.0502 4.8434 6.4645 5.9084 % e = 0.0502 -0.1566 0.4645 -1.0916