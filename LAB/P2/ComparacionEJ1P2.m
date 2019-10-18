
Ts = 100e-3;
error_margin = 0.01;
w0 = 30*pi/180;
x0 = 0;
y0 = 0;
draw = 1;

N=3;
x_vec_control=[];
y_vec_control=[];

x_vec_net=[];
y_vec_net=[];


for i=1:N
    refx=10*rand-5;
    refy=10*rand-5;
    sim('PositionControl.slx')
    
    x_vec_control=[x_vec_control; salida_x.signals.values];
    y_vec_control=[y_vec_control; salida_y.signals.values];
    if (draw)
        x=salida_x.signals.values;
        y=salida_y.signals.values;
        figure('Name', strcat(i, '_control'))
        hold on
        plot(x,y)
        plot(refx,refy, 'or')
        plot(x0,y0, 'ob')
        grid on
        hold off
    end
    
    sim('PositionControlNN.slx')
    x_vec_net=[x_vec_net; salida_x_net.signals.values];
    y_vec_net=[y_vec_net; salida_y_net.signals.values];
    if (draw)
        x=salida_x.signals.values;
        y=salida_y.signals.values;
        figure('Name', strcat(i, '_net'))
        hold on
        plot(x,y)
        plot(refx,refy, 'or')
        plot(x0,y0, 'ob')
        grid on
        hold off
    end
end


