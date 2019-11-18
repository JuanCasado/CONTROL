% Single-Input Neuron
net = linearlayer;
net = configure(net,[0],[0]); 
view(net)
%VER VALORES DE INICIO POR DEFECTO
W = net.IW{1,1};
%W = 0
b = net.b{1};
%b = 0
% Assign arbitrary values to the weights and bias
net.IW{1,1} = [3];
net.b{1} = -1.5;
% You can simulate the Net for a particular input vector.
p = {2};
a = sim(net,p)