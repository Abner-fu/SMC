close all;

figure(1);
plot(t,x_SMC(:,1),t,x_TSMC(:,1),t,x_SMCQ(:,1),t,x_TSMCQ(:,1),'linewidth',2);
title("x1");
xlabel('time(s)');ylabel('State response');
legend('SMC','TSMC','SMCQ', 'TSMCQ');

figure(2);
plot(t,x_SMC(:,2),t,x_TSMC(:,2),t,x_SMCQ(:,2),t,x_TSMCQ(:,2),'linewidth',2);
title("x2");
xlabel('time(s)');ylabel('State response');
legend('SMC','TSMC','SMCQ', 'TSMCQ');

figure(3);
q=3;p=5;
plot(x_TSMCQ(:,1),x_TSMCQ(:,2),'r',x_TSMCQ(:,1),-x_TSMCQ(:,1)-(abs(x_TSMCQ(:,1))).^(q/p).*sign(x_TSMCQ(:,1)),'b','linewidth',2);
title("TSMCQ");
xlabel('x1');ylabel('x2');

figure(4);
plot(x_SMC(:,1),x_SMC(:,2),'r',x_SMC(:,1),-x_SMC(:,1),'b','linewidth',2);
title("SMC");
xlabel('x1');ylabel('x2');

figure(5);
plot(x_TSMC(:,1),x_TSMC(:,2),'r',x_TSMC(:,1),-x_TSMC(:,1)-(abs(x_TSMC(:,1))).^(q/p).*sign(x_TSMC(:,1)),'b','linewidth',2);
title("TSMC");
xlabel('x1');ylabel('x2');

figure(6);
plot(x_SMCQ(:,1),x_SMCQ(:,2),'r',x_SMCQ(:,1),-x_SMCQ(:,1),'b','linewidth',2);
title("SMCQ");
xlabel('x1');ylabel('x2');