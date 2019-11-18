% Recurrent dynamic network (NARX)
% Data to model a magnetic levitation system
load magdata
u = con2seq(u); %inputs
y = con2seq(y); %outputs
% Create a series-parallel NARX network
d1 = [1:2];
d2 = [1:2];
narx_net = narxnet(d1,d2,10);

view(narx_net)

narx_net.divideFcn = '';
narx_net.trainParam.min_grad = 1e-10;



[p,Pi,Ai,t] = preparets(narx_net,u,{},y); %prepares data for the training
narx_net = train(narx_net,p,t,Pi);
% Simulate the network
yp = sim(narx_net,p,Pi);
% Calculate the resulting errors for the series-parallel implementation
e = cell2mat(yp)-cell2mat(t);
figure(1); plot(e);
xlabel('samples'); ylabel('error'); title('series-parallel error');
% Converting NARX from the series-parallel configuration (open loop) to the parallel
% configuration (closed loop)
narx_net_closed = closeloop(narx_net);
view(narx_net); view(narx_net_closed);
% Use the closed-loop (parallel) configuration to perform an iterated prediction
y1 = y(1700:2600);
u1 = u(1700:2600);
[p1,Pi1,Ai1,t1] = preparets(narx_net_closed,u1,{},y1);
yp1 = narx_net_closed(p1,Pi1,Ai1);
figure(2); TS = size(t1,2); plot(1:TS,cell2mat(t1),'b',1:TS,cell2mat(yp1),'r') 
xlabel('inputs'); ylabel('outputs'); title('Prediction with closed-loop NARX');
% You can also create a parallel (closed loop) NARX network, using the
% narxnet command. The training takes longer and the resulting performance is worse
% net = narxnet(d1,d2,10,'closed');

