function [sys,x0,str,ts]=s_function(t,x,u,flag)
switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1,
    sys=mdlDerivatives(t,x,u);
case 3,
    sys=mdlOutputs(t,x,u);
case {2, 4, 9 }
    sys = [];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 1;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 1;
sizes.NumInputs      = 4;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys=simsizes(sizes);
x0=[12.5];
str=[];
ts=[];
function sys=mdlDerivatives(t,x,u)
signs = sign(u(4));
v = -10*signs;
sys(1) = v - 0.1*x(1);

function sys=mdlOutputs(t,x,u)
x1 = u(1);
x2 = u(2);
x3 = u(3);

ut = -x2^3 - 15*sign(x3)*abs(x3)^(7/10) -  66*sign(x2)*abs(x2)^(7/13) - 80*abs(x1)^(7/16)*sign(x1) + x(1);
sys(1)=ut;
