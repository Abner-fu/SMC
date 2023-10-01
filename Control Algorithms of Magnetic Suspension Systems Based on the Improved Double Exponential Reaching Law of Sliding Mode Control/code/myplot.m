close all;

figure(1);
plot(t, x_SMC(:,1),t, x_PRL_I_SMC(:,1), t, x_DPRL_I_SMC(:,1),'linewidth',2);
title("x1");
xlabel('time(s)');ylabel('gap(m)');
legend('SMC', 'PRL-I-SMC', 'DPRL-I-SMC');

figure(2);
plot(t, x_SMC(:,2),t, x_PRL_I_SMC(:,2),t, x_DPRL_I_SMC(:,2), 'linewidth',2);
title("dx1");
xlabel('time(s)');ylabel('speed(m/s)');
legend('SMC', 'PRL-I-SMC', 'DPRL-I-SMC');

figure(3);
plot(t, x_SMC(:,3),t, x_PRL_I_SMC(:,3),t, x_DPRL_I_SMC(:,3),'linewidth',2);
title("ddx1");
xlabel('time(s)');ylabel('acceleration(m/s^2)');
legend('SMC', 'PRL-I-SMC', 'DPRL-I-SMC');

figure(4);
plot(t, x_SMC(:,4),t, x_PRL_I_SMC(:,4),t, x_DPRL_I_SMC(:,4),'linewidth',2);
title("i");
xlabel('time(s)');ylabel('current(A)');
legend('SMC', 'PRL-I-SMC', 'DPRL-I-SMC');

figure(5);
plot(t(4334:end,1), u_SMC(4334:end,1),t(4334:end,1), u_PRL_I_SMC(4334:end,1),t(4334:end,1), u_DPRL_I_SMC(4334:end,1),'linewidth',2);
title("u");
xlabel('time(s)');ylabel('voltage(V)');
legend('SMC', 'PRL-I-SMC', 'DPRL-I-SMC');
ylim([0 inf]);


% figure(3);
% q=3;p=5;
% plot(x_TSMCQ(:,1),x_TSMCQ(:,2),'r',x_TSMCQ(:,1),-x_TSMCQ(:,1)-(abs(x_TSMCQ(:,1))).^(q/p).*sign(x_TSMCQ(:,1)),'b','linewidth',2);
% title("TSMCQ");
% xlabel('x1');ylabel('x2');
% 
% figure(4);
% plot(x_SMC(:,1),x_SMC(:,2),'r',x_SMC(:,1),-x_SMC(:,1),'b','linewidth',2);
% title("SMC");
% xlabel('x1');ylabel('x2');
% 
% figure(5);
% plot(x_TSMC(:,1),x_TSMC(:,2),'r',x_TSMC(:,1),-x_TSMC(:,1)-(abs(x_TSMC(:,1))).^(q/p).*sign(x_TSMC(:,1)),'b','linewidth',2);
% title("TSMC");
% xlabel('x1');ylabel('x2');
% 
% figure(6);
% plot(x_SMCQ(:,1),x_SMCQ(:,2),'r',x_SMCQ(:,1),-x_SMCQ(:,1),'b','linewidth',2);
% title("SMCQ");
% xlabel('x1');ylabel('x2');