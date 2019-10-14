
Ts = 100e-3;
error_margin = 0.01;
th_0 = 30*pi/180;
x_0 = 0;
y_0 = 0;
draw = 1;

N=1;
E_d_vec=[];
E_theta_vec=[];
V_vec=[];
W_vec=[];

for i=1:N
    sim('PositionControlNARX.slx')
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
        %plot(refx,refy, 'or')
        plot(x0,y0, 'ob')
        grid on
        hold off
    end
end

inputs=[E_d_vec'; E_theta_vec'];
targets=[V_vec'; W_vec'];



