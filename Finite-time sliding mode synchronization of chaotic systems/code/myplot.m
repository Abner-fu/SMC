close all;
clc;
e1 = y(:,1) - x(:,1);
e2 = y(:,2) - x(:,2);
e3 = y(:,3) - x(:,3);

e11 = y_p(:,1) - x_p(:,1);
e22 = y_p(:,2) - x_p(:,2);
e33 = y_p(:,3) - x_p(:,3);

figure(1);
plot(t,e1, t, e2, t, e3 ,t, e11, t, e22,t, e33, 'linewidth',2);
xlabel('time(s)');ylabel('State response');
legend('proposed e1', 'proposed e2', 'proposed e3', 'conventional e1', 'conventional e2', 'conventional e3');
ylim([-0.2 0.6]);