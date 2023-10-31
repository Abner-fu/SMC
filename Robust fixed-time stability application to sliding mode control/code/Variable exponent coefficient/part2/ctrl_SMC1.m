function [sys,x0,str,ts]=s_function(t,x,u,flag)
switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 3,
    sys=mdlOutputs(t,x,u);
case {2, 4, 9 }
    sys = [];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 2;
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys=simsizes(sizes);
x0=[];
str=[];
ts=[];
function sys=mdlOutputs(t,x,u)
x1 = u(1);
x2 = u(2);

beta = 0.2;
lambda1 = 2;
u1 = 0.1;

k1 = 20;
k2 = 20;
alpha = 1.5;


s = x2 + beta*abs(x1)^(lambda1*x1^2/(1+u1*x1^2))*sign(x1);

ut = -(k1*sign(s)+k2*abs(s)^alpha*sign(s) + beta*lambda1*abs(x1)*x2/(1+u1*x1^2)*(2*log(abs(x1))/(1+u1*x1^2) + 1)*abs(x1)^(lambda1*x1^2/(1+u1*x1^2)) );

sys(1)=ut;
sys(2)=s;
