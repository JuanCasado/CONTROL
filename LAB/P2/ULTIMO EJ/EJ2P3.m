
Ts = 100e-3;
error_margin = 0.01;
th_0 = 30*pi/180;
x_0 = 0;
y_0 = 0;
N = 1;

E_d_vec=[];
E_theta_vec=[];
V_vec=[];
W_vec=[];

for num = 0:N
    for num2 = 0:N
        x_0 = num;
        y_0 = num2;
        sim('PositionControlNARX.slx')
        E_d_vec=[E_d_vec;E_d.signals.values];
        E_theta_vec=[E_theta_vec;E_theta.signals.values];
        V_vec=[V_vec; V.signals.values];
        W_vec=[W_vec; W.signals.values];
    end
end

inputs=[E_d_vec'; E_theta_vec'];
targets=[V_vec'; W_vec'];

nT = size(inputs, 2);
inputsc = mat2cell(inputs, 2, ones(nT, 1));
outputsc = mat2cell(targets, 2, ones(nT, 1));

nNeuronas= 20;
performanceMejor = 100;
netElegida = '';
internal_performanceMejor = 100;
internal_netElegida = '';

for i=5:nNeuronas
    for j= 1:5
        net = narxnet(1:2, 1, [i]);

        [x,xi,ai,t] = preparets(net,inputsc,{},outputsc);

        net = train(net,x,t,xi,ai);
        net = closeloop(net);

        outputs = net(inputs);
        errors = gsubtract(outputs, targets);
        performance = perform(net,targets,outputs);
        
        if (performance < internal_performanceMejor)
           internal_netElegida = net;
           internal_performanceMejor = performance;
        end
    end
    if (performance < performanceMejor)
       netElegida = net;
       performanceMejor = performance;
    end
end

view(netElegida)
display(performanceMejor)
gensim(netElegida,Ts);
