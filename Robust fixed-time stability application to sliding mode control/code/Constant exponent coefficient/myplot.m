close all;
clc;

s1 = x1(:,2)+x1(:,1);
aa1 = sqrt( x1(:,1).^2 + x1(:,2).^2 );
s2 = x2(:,2)+x2(:,1);
aa2 = sqrt( x2(:,1).^2 + x2(:,2).^2 );
s3 = x3(:,2)+x3(:,1);
aa3 = sqrt( x3(:,1).^2 + x3(:,2).^2 );

figure(1);
subplot(211);
plot(t,s1,t,s2,t,s3,'linewidth',1);
legend("case1","case2","case3");
xlabel('time(s)');ylabel('s');
set(gca,'YTick',[0:2:10]);
grid on;

subplot(212);
plot(t,aa1,t, aa2, t,aa3,'linewidth',1);
legend("case1","case2","case3");
xlabel('time(s)');ylabel('||x(t)||');
set(gca,'YTick',[0:2:10]);
grid on;