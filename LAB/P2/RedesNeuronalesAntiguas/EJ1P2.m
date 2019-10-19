
Ts = 100e-3;
error_margin = 0.01;
w0 = 30*pi/180;
x0 = 0;
y0 = 0;
draw = 0;

N=30;
E_d_vec=[];
E_theta_vec=[];
V_vec=[];
W_vec=[];

for i=1:N
    refx=10*rand-5;
    refy=10*rand-5;
    sim('PositionControl.slx')
    E_d_vec=[E_d_vec;E_d.signals.values];
    E_theta_vec=[E_theta_vec;E_theta.signals.values];
    V_vec=[V_vec; V.signals.values];
    W_vec=[W_vec; W.signals.values];
    if (draw)
        x=salida_x.signals.values;
        y=salida_y.signals.values;
        figure('Name', strcat(i))
        hold on
        plot(x,y)
        plot(refx,refy, 'or')
        plot(x0,y0, 'ob')
        grid on
        hold off
    end
end

inputs=[E_d_vec'; E_theta_vec'];
targets=[V_vec'; W_vec'];

net = feedforwardnet([15]);
net = configure(net,inputs,targets);
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

net = train(net,inputs,targets);

outputs = net(inputs);
errors = gsubtract(outputs,targets);
performance = perform(net,targets,outputs)

gensim(net,Ts);


