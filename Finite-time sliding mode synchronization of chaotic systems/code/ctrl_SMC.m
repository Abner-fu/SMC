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
sizes.NumOutputs     = 3;
sizes.NumInputs      = 9;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys=simsizes(sizes);
x0=[];
str=[];
ts=[];
function sys=mdlOutputs(t,x,u)
s1 = u(1);
s2 = u(2);
s3 = u(3);

x1 = u(4);
x2 = u(5);
x3 = u(6);

y1 = u(7);
y2 = u(8);
y3 = u(9);

e1 = y1 - x1;
e2 = y2 - x2;
e3 = y3 - x3;

espilon = 0.001;

sys(1)=0.5*(-x1)+x2^2 - 10*(y2-y1) - 5*e1/(abs(e1)+espilon) - 10*e1 - 5*s1/(abs(s1)+espilon) - 10*s1;
sys(2)=2.5*x2-x1*x3 - (30*y1 - y2 -y1*y3) - 5*e2/(abs(e2)+espilon) - 10*e2 - 5*s2/(abs(s2)+espilon) - 10*s2;
sys(3)=x2-4*x3 - (-8/3*y3+y1*y2) - 5*e3/(abs(e3)+espilon) - 10*e3 - 5*s3/(abs(s3)+espilon) - 10*s3;