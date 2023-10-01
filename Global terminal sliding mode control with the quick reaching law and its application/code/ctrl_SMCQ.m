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
x1=u(1);
x2=u(2);

c=1;
k1=1.1;
k2=0.7;
b=1+k2/k1;
a=0.2;
aita=0.5;
D=1;
p=5;q=3;

s = x2 + c*x1;
ut = -c*x2  - (k1*(b^(abs(s))-1) + k2*abs(s)^a + (D+aita))*sign(s);

sys(1)=ut;
