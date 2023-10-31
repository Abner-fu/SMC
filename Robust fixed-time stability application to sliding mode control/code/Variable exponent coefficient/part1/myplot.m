close all;
clc;

figure(1);
subplot(211);
plot(t,u(:,2),'linewidth',1);
xlabel('time(s)');ylabel('s');
ylim([-1, 4]);
grid on;

subplot(212);
plot(t,x(:,1),t,x(:,2),'linewidth',1);
legend("x1", "x2");
xlabel('time(s)');ylabel('x');
grid on;

figure(2)
plot(t,u1(:,2), t,u2(:,2),t,u3(:,2),'linewidth',1);
legend("x_2(0) = 1", "x_2(0) = 5", "x_2(0) = 10");
grid on;
xlabel('time(s)');ylabel('s');