
Ts = 100e-3;
error_margin = 0.01;
th_0 = 30*pi/180;
x_0 = 0;
y_0 = 0;
draw = 1;

N=3;
x_vec_control=[];
y_vec_control=[];

x_vec_net=[];
y_vec_net=[];


for i=1:N
    for j = 1:N
        x_0 = i;
        y_0 = j;
        sim('PositionControlNARX.slx')

        x_vec_control=[x_vec_control; salida_x.signals.values];
        y_vec_control=[y_vec_control; salida_y.signals.values];
        if (draw)
            x=salida_x.signals.values;
            y=salida_y.signals.values;
            figure('Name', strcat(i, '_control'))
            hold on
            plot(x,y)
            plot(x_0,y_0, 'ob')
            grid on
            hold off
        end

        sim('PositionControlNARX_NN.slx')
        x_vec_net=[x_vec_net; salida_x_net.signals.values];
        y_vec_net=[y_vec_net; salida_y_net.signals.values];
        if (draw)
            x=salida_x.signals.values;
            y=salida_y.signals.values;
            figure('Name', strcat(i, '_net'))
            hold on
            plot(x,y)
            plot(x_0,y_0, 'ob')
            grid on
            hold off
        end
    end
end
