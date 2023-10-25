close all;

figure(1);
plot(t,x(:,1),t,x(:,2),t,x(:,3),'linewidth',2);
xlabel('time(s)');ylabel('state response');
legend("x1", "x2", "x3");

figure(2);
plot(t,u(:,1),'linewidth',2);
xlabel('time(s)');ylabel('control');



