function kf11
% electric energy wrt temperature
% Time Invariant Kalman Filter
% Steady State Kalman Filter
% model parameters
n=1;
m=1;
F=1;
H=-350;
Q=0.3;
R=0.2;
s=400;
% initialization parameters
x0=1.1;
xe0=1.1;
pe0=0.1;
% Riccati Equation Kalman Filter
PP=dare(F',H',Q,R);
K=PP*H'*inv(H*PP*H'+R);
PE=(eye(n)-K*H)*PP;
% Steady State Kalman Filter parameters
A=(eye(n)-K*H)*F;
B=K;
% time
days=7;
kmax=24*days;

% measurements
X=[x0];
Z=[];
x=x0;
for k=0:kmax-1
x=F*x+sqrt(Q)*randn; X=[X x];
z=H*x+s+sqrt(R)*randn; Z=[Z z];
end;
% Kalman Filter
% initialisation
xe=xe0;
pe=pe0;
XE=[xe];
PE=[pe];
for k=0:kmax-1
xp=F*xe;
pp=Q+F*pe*F';
g=pp*H'*inv(H*pp*H'+R);
xe=(eye(n)-g*H)*xp+g*(Z(k+1)-s);
pe=(eye(n)-g*H)*pp;
XE=[XE xe];
PE=[PE pe];
end;
XEKF=XE;
PEKF=PE;

% Steady State Kalman filter
xe=xe0;
XE=xe;
for k=0:kmax-1
xe=A*xe+B*(Z(k+1)-s);
XE=[XE xe];
end;
XESSKF=XE;
ERRORKF=sum(abs(X-XEKF)./X)*100/kmax
ERRORSSKF=sum(abs(X-XESSKF)./X)*100/kmax
% plots
timek=[0:kmax];
figure(1);
ymin=min([min(X),min(XEKF),min(XESSKF)]);
ymax=max([max(X) max(XEKF),max(XESSKF)]);
axis([0,100,ymin,ymax]);
plot(timek,X,'b',timek,XEKF,'rd',timek,XESSKF,'go');
legend('actual','KF','SSKF');
xlabel('time k');
ylabel('electric energy');
title('electric energy estimation');
figure(2);
plot(timek,PEKF,'b');
axis([0,100,0,1]);
legend('KF');
xlabel('time k');
ylabel('electric energy varianve');
title('electric energy estimation');