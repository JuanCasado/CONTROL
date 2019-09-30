% Multi-Layer Network
% Create a two-layer feedforward network
net = feedforwardnet;
view(net)
% Check the DIMMENSIONS: inputs, layers and outputs of the net
% Check the CONNECTIONS structure and change the bias
net.biasConnect=[1;0];
view(net)
% Check the SUBOBJECTS of the network
% View the layers subobject for the first layer
net.layers{1};
% Which is the number of neurons in the first layer?
% Change the number of neurons in the first layer to 3 
net.layers{1}.dimensions=3;
% What is the transfer function used in the first layer?
% Change the transfer function to logsig
net.layers{1}.transferFcn = 'logsig';
% View the layerWeights subobject for the weight between layer 1 and layer 2 
net.layerWeights{2,1}
% What is the size of this layer weights? Justify the answer
%Configure Neural Network Inputs and Outputs using sequential inputs
p = {[0;0] [0;1] [1;0] [1;1]}; % sequence of 4 inputs: p(2x1)
t = {[0;1] [1;0] [1;0] [0;1]}; % sequence of 4 targets: t(2x1)
net = configure(net,p,t);
view(net)
net.layerWeights{2,1}
% What is now the size of this layer weights?
p = [2; 3];
a = sim(net, p)