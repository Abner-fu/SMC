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
sizes.NumOutputs     = 1;
sizes.NumInputs      = 5;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys=simsizes(sizes);
x0=[];
str=[];
ts=[];
function sys=mdlOutputs(t,x,u)
e = u(1);
de = u(2);
dde = u(3);
ef = u(4);

x1 = e + 0.01;
x2 = de;
x3 = dde;

m = 750;
R = 0.7;

f1 = (R*u(5)^2) / (m*x1);
g1 = -(u(5)/(m*x1));

c1 = 144;
c2 = 24;
c3 = 0.005;
k = 40;
alpha = 0.6;

s = c1*e + c2*de + dde + c3*ef;

ut = (-f1 - c2*x3 -c1*x2 + c3*(0.01-x1) - k*abs(s)^alpha*sign(s))/g1;

sys(1)=ut;
