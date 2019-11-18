% Perceptron example with sequential inputs
net = perceptron;
% The input vectors and targets are
p = {[1;2] [-1;2] [0;-1]}
t = {1 0 0}
net = configure(net,p,t);
% Remove bias
net.biasConnect = 0;
% Weights initialization
net.IW{1,1} = [1 -0.8];
view(net);
% Train the network
[net,a,e,pf] = adapt(net,p,t);
% Intermediate values
a % a = {[0]} {[1]} {[1]}
e % e = {[1]} {[-1]} {[-1]}
% The new weights after applying all input vectors are:
w = net.iw{1,1} % w = [3 0.2]
% Simulate the trained network for each of the inputs.
a = net(p) % a = 1 0 0
% Calculate the error
error = cell2mat(a)-cell2mat(t) % error = 0 0 0
%The outputs equal the targets, so you don't need to train the network
%for more than one pass. It this wasn't the case you should try more epochs. 
%net.trainParam.epochs = 1;