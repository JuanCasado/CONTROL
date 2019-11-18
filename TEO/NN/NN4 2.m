% Sequential Inputs in a Dynamic Network
net = linearlayer([0 1]); %[0 1] delay elements 
net.inputs{1}.size = 1; 
net.layers{1}.dimensions = 1;
net.biasConnect = 0;
view(net);
% Assign the weight matrix to be 
W = [1 2] 
net.IW{1} = [1 2];
% Suppose that the input sequence is:
P = {1 2 3 4}; % Elements of a cell array
% You can now simulate the network:
A = net(P)
% A = [1] [4] [7] [10]