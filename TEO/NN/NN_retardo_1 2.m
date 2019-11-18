% Incremental Training with Dynamic Networks
Pi = {1}; % Initial input
P = {2 3 4};
T = {3 5 7};
%Network architecture
net = linearlayer([0 1],0.1);
net = configure(net,P,T);
net.IW{1,1} = [0 0]; net.biasConnect = 0;
net.trainParam.epochs = 1; [net,a,e,pf] = adapt(net,P,T,Pi);
net.IW{1,1} % ans = [0.9880 0.5260] 
% a = [0] [2.4] [7.98]
% e = [3] [2.6] [-0.98]
% Batch Training with Dynamic Networks
net = linearlayer([0 1],0.02);
net = configure(net,P,T); 
net.IW{1,1} = [0 0]; 
net.biasConnect = 0; 
net.trainParam.epochs = 1;
net = train(net,P,T,Pi); 
net.IW{1,1} % ans = [0.9800 0.6800]