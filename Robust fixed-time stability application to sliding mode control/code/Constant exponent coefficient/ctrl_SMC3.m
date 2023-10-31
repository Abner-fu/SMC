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

k1 = 2;
k2 = 2;
k3 = 2;
k4 = 2;

alpha = 1.5;
gama = 0.5;

s = x2 + x1;

ut = -(x2 + k1*sign(s) + k2*abs(s)^alpha*sign(s)+k3*abs(s)^gama*sign(s)+k4*s);

sys(1)=ut;
