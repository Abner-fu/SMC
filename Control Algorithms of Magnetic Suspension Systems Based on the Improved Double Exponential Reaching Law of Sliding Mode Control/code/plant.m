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
sizes.NumContStates  = 4;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 4;
sizes.NumInputs      = 1;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 0;
sys=simsizes(sizes);
x0=[0.016 0 10 0.1];
str=[];
ts=[];
function sys=mdlDerivatives(t,x,u)
m = 750;
R = 0.7;

f1 = (R*x(4)^2) / (m*x(1));
g1 = -x(4)/(m*x(1));
u0 = 4*pi*1e-7;
N = 350;
A = 0.0151;
k_ = (u0*A*N^2)/4;

sys(1)=x(2);
sys(2)=x(3);
sys(3)=f1+g1*u(1);
sys(4)=x(2)*x(4)/x(1) - R*x(1)*x(4)/(2*k_) + x(1)*u(1)/(2*k_);

function sys=mdlOutputs(t,x,u)
sys(1)=x(1);
sys(2)=x(2);
sys(3)=x(3);
sys(4)=x(4);