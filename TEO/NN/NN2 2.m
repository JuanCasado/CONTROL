% Single-Layer Network
net = linearlayer;
net = configure(net,[0;0;0],[0;0]); %p(3x1), a(2x1)
view(net)
% Assign arbitrary values to the weights and bias
net.IW{1,1} = [1 2 3; 1 2 3]; %W(2x3)
net.b{1} = [1.5;-1.5] %b(2x1)
% You can simulate the Net for a particular input vector.
p = [2;1;-1];
a = sim(net,p)
%a =
% 2.5000
% -0.5000