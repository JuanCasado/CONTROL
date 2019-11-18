% Incremental Training of ADALINE (Static Network) % Inputs and targets as sequences:
p = {[2;2] [1;-2] [-2;2] [-1;1]};
t = {4 5 6 7};
% First, set the delays and initial learning rate to zero. Also, set up the
% network with zero initial weights and biases to show the effect of incremental training. 
net = linearlayer(0,0); % 1º: delays=0 (retardadores), 2º: lr=0(Learning rate)
net = configure(net,p,t);
net.IW{1,1} = [0 0];
net.b{1} = 0;
view(net);
% train the network incrementally
[net,a,e,pf] = adapt(net,p,t);
% a = [0] [0] [0] [0]
% e = [4] [5] [6] [7]
% If you now set the learning rate to 0.1 you can see how the network is
% adjusted as each input is presented:
net.inputWeights{1,1}.learnParam.lr = 0.1;
net.biases{1,1}.learnParam.lr = 0.1;
net.trainParam.epochs = 1;
[net,a,e,pf] = adapt(net,p,t);
% a = [0] [-0.4] [-2.3] [3.47]
% e = [4] [5.4] [8.3] [3.53]
% To reach a better adjustment more epochs in the training are needed 
net.trainParam.epochs = 100;
net.inputWeights{1,1}.learnParam.lr = 0.01;
net.biases{1,1}.learnParam.lr = 0.01;
net = adapt(net,p,t);
a = net(p)
e = cell2mat(a)-cell2mat(t)
% a = {[4.1716]} {[-1.6165]} {[6.6617] {[4.4365]}}
% e = 0.1716 -6.6165 0.6617 -2.5635