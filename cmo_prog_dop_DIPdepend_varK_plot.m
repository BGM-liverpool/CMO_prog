clear all
close all
param=cmo_prog.cmo_param;
ini=cmo_prog.cmo_ini(param);
dopuse='DIP';
nulim='';
[T1, Y1] = cmo_prog.cmo_prog(param,ini,dopuse,nulim);
rate1 = cmo_prog.cmo_rate(Y1,param,dopuse,nulim);
param.kdip=0.02;
[T2, Y2] = cmo_prog.cmo_prog(param,ini,dopuse,nulim);
rate2 = cmo_prog.cmo_rate(Y2,param,dopuse,nulim);
param.kdip=0.05;
[T3, Y3] = cmo_prog.cmo_prog(param,ini,dopuse,nulim);
rate3 = cmo_prog.cmo_rate(Y3,param,dopuse,nulim);
param.kdip=0.10;
[T4, Y4] = cmo_prog.cmo_prog(param,ini,dopuse,nulim);
rate4 = cmo_prog.cmo_rate(Y4,param,dopuse,nulim);
param.kdip=0.15;
[T5, Y5] = cmo_prog.cmo_prog(param,ini,dopuse,nulim);
rate5 = cmo_prog.cmo_rate(Y5,param,dopuse,nulim);
param.kdip=0.2;
[T6, Y6] = cmo_prog.cmo_prog(param,ini,dopuse,nulim);
rate6 = cmo_prog.cmo_rate(Y6,param,dopuse,nulim);
param.kdip=0.25;
[T7, Y7] = cmo_prog.cmo_prog(param,ini,dopuse,nulim);
rate7 = cmo_prog.cmo_rate(Y7,param,dopuse,nulim);
param.kdip=0.30;
[T8, Y8] = cmo_prog.cmo_prog(param,ini,dopuse,nulim);
rate8 = cmo_prog.cmo_rate(Y8,param,dopuse,nulim);
param.kdip=0.35;
[T9, Y9] = cmo_prog.cmo_prog(param,ini,dopuse,nulim);
rate9 = cmo_prog.cmo_rate(Y9,param,dopuse,nulim);
param.kdip=0.40;
[T10, Y10] = cmo_prog.cmo_prog(param,ini,dopuse,nulim);
rate10 = cmo_prog.cmo_rate(Y10,param,dopuse,nulim);

DIN=[Y1(:,1),Y2(:,1),Y3(:,1),Y4(:,1),Y5(:,1),Y6(:,1),Y7(:,1),Y8(:,1),Y9(:,1),Y10(:,1)];
DIP=[Y1(:,2),Y2(:,2),Y3(:,2),Y4(:,2),Y5(:,2),Y6(:,2),Y7(:,2),Y8(:,2),Y9(:,2),Y10(:,2)];
PhyC=[Y1(:,3),Y2(:,3),Y3(:,3),Y4(:,3),Y5(:,3),Y6(:,3),Y7(:,3),Y8(:,3),Y9(:,3),Y10(:,3)];
PhyN=[Y1(:,4),Y2(:,4),Y3(:,4),Y4(:,4),Y5(:,4),Y6(:,4),Y7(:,4),Y8(:,4),Y9(:,4),Y10(:,4)]+param.Q0N.*PhyC;
PhyP=[Y1(:,5),Y2(:,5),Y3(:,5),Y4(:,5),Y5(:,5),Y6(:,5),Y7(:,5),Y8(:,5),Y9(:,5),Y10(:,5)]+param.Q0P.*PhyC;
Chl=[Y1(:,6),Y2(:,6),Y3(:,6),Y4(:,6),Y5(:,6),Y6(:,6),Y7(:,6),Y8(:,6),Y9(:,6),Y10(:,6)];
DOP=[Y1(:,7),Y2(:,7),Y3(:,7),Y4(:,7),Y5(:,7),Y6(:,7),Y7(:,7),Y8(:,7),Y9(:,7),Y10(:,7)];
NT=DIN+PhyN;
PT=DIP+PhyP+DOP;
rate.QN=[rate1.QN,rate2.QN,rate3.QN,rate4.QN,rate5.QN,rate6.QN,rate7.QN,rate8.QN,rate9.QN,rate10.QN];
rate.QP=[rate1.QP,rate2.QP,rate3.QP,rate4.QP,rate5.QP,rate6.QP,rate7.QP,rate8.QP,rate9.QP,rate10.QP];
rate.fV=[rate1.fV,rate2.fV,rate3.fV,rate4.fV,rate5.fV,rate6.fV,rate7.fV,rate8.fV,rate9.fV,rate10.fV];
rate.fN=[rate1.fN,rate2.fN,rate3.fN,rate4.fN,rate5.fN,rate6.fN,rate7.fN,rate8.fN,rate9.fN,rate10.fN];
rate.fC=[rate1.fC,rate2.fC,rate3.fC,rate4.fC,rate5.fC,rate6.fC,rate7.fC,rate8.fC,rate9.fC,rate10.fC];
rate.VN=[rate1.VN,rate2.VN,rate3.VN,rate4.VN,rate5.VN,rate6.VN,rate7.VN,rate8.VN,rate9.VN,rate10.VN];
rate.VP=[rate1.VP,rate2.VP,rate3.VP,rate4.VP,rate5.VP,rate6.VP,rate7.VP,rate8.VP,rate9.VP,rate10.VP];
rate.VC=[rate1.VC,rate2.VC,rate3.VC,rate4.VC,rate5.VC,rate6.VC,rate7.VC,rate8.VC,rate9.VC,rate10.VC];
rate.theta=[rate1.theta,rate2.theta,rate3.theta,rate4.theta,rate5.theta,rate6.theta,rate7.theta,rate8.theta,rate9.theta,rate10.theta];
rate.tch=[rate1.tch,rate2.tch,rate3.tch,rate4.tch,rate5.tch,rate6.tch,rate7.tch,rate8.tch,rate9.tch,rate10.tch];
rate.VNh0=[rate1.VNh0,rate2.VNh0,rate3.VNh0,rate4.VNh0,rate5.VNh0,rate6.VNh0,rate7.VNh0,rate8.VNh0,rate9.VNh0,rate10.VNh0];
rate.VPh0=[rate1.VPh0,rate2.VPh0,rate3.VPh0,rate4.VPh0,rate5.VPh0,rate6.VPh0,rate7.VPh0,rate8.VPh0,rate9.VPh0,rate10.VPh0];
rate.A=[rate1.A,rate2.A,rate3.A,rate4.A,rate5.A,rate6.A,rate7.A, rate8.A,rate9.A,rate10.A];
rate.VDOP=[rate1.VDOP,rate2.VDOP,rate3.VDOP,rate4.VDOP,rate5.VDOP,rate6.VDOP,rate7.VDOP,rate8.VDOP,rate9.VDOP,rate10.VDOP];
rate.VDIP=[rate1.VDIP,rate2.VDIP,rate3.VDIP,rate4.VDIP,rate5.VDIP,rate6.VDIP,rate7.VDIP,rate8.VDIP,rate9.VDIP,rate10.VDIP];
figure(1),
subplot(3,3,1)
plot(T1,DIN)
ylabel('DIN')
legend('0.01','0.02','0.05','0.1','0.15','0.2','0.25','0.3','0.35','0.4')
subplot(3,3,2)
plot(T1,DIP)
ylabel('DIP')
 legend('0.01','0.02','0.05','0.1','0.15','0.2','0.25','0.3','0.35','0.4')
subplot(3,3,3)
plot(T1,PhyC)
ylabel('PhyC')
 legend('0.01','0.02','0.05','0.1','0.15','0.2','0.25','0.3','0.35','0.4')
subplot(3,3,4)
plot(T1,PhyN)
ylabel('PhyN')
legend('0.01','0.02','0.05','0.1','0.15','0.2','0.25','0.3','0.35','0.4')
subplot(3,3,5)
plot(T1,PhyP)
ylabel('PhyP')
legend('0.01','0.02','0.05','0.1','0.15','0.2','0.25','0.3','0.35','0.4')
subplot(3,3,6)
plot(T1,Chl)
ylabel('Chl')
legend('0.01','0.02','0.05','0.1','0.15','0.2','0.25','0.3','0.35','0.4')
subplot(3,3,7)
plot(T1,NT)
ylabel('NT')
legend('0.01','0.02','0.05','0.1','0.15','0.2','0.25','0.3','0.35','0.4')
subplot(3,3,8)
plot(T1,PT)
ylabel('PT')
legend('0.01','0.02','0.05','0.1','0.15','0.2','0.25','0.3','0.35','0.4')
subplot(3,3,9)
plot(T1,DOP)
ylabel('DOP')
legend('0.01','0.02','0.05','0.1','0.15','0.2','0.25','0.3','0.35','0.4')
figure(2),
subplot(4,4,1)
plot(T1,rate.QN)
ylabel('QN')
legend('0.01','0.02','0.05','0.1','0.15','0.2','0.25','0.3','0.35','0.4')
subplot(4,4,2)
plot(T1,rate.QP)
ylabel('QP')
legend('0.01','0.02','0.05','0.1','0.15','0.2','0.25','0.3','0.35','0.4')
subplot(4,4,3)
plot(T1,rate.fV)
legend('0.01','0.02','0.05','0.1','0.15','0.2','0.25','0.3','0.35','0.4')
ylabel('fV')
subplot(4,4,4)
plot(T1,rate.fN)
ylabel('fN')
legend('0.01','0.02','0.05','0.1','0.15','0.2','0.25','0.3','0.35','0.4')
subplot(4,4,5)
plot(T1,rate.fC)
ylabel('fC')
legend('0.01','0.02','0.05','0.1','0.15','0.2','0.25','0.3','0.35','0.4')
subplot(4,4,6)
plot(T1,rate.VN)
ylabel('VN')
legend('0.01','0.02','0.05','0.1','0.15','0.2','0.25','0.3','0.35','0.4')
subplot(4,4,7)
plot(T1,rate.VP)
ylabel('VP')
legend('0.01','0.02','0.05','0.1','0.15','0.2','0.25','0.3','0.35','0.4')
subplot(4,4,8)
plot(T1,rate.VC)
ylabel('VC')
legend('0.01','0.02','0.05','0.1','0.15','0.2','0.25','0.3','0.35','0.4')
subplot(4,4,9)
plot(T1,rate.theta)
ylabel('theta')
legend('0.01','0.02','0.05','0.1','0.15','0.2','0.25','0.3','0.35','0.4')
subplot(4,4,10)
plot(T1,rate.tch)
legend('0.01','0.02','0.05','0.1','0.15','0.2','0.25','0.3','0.35','0.4')
ylabel('tch')
subplot(4,4,11)
plot(T1,rate.VNh0)
legend('0.01','0.02','0.05','0.1','0.15','0.2','0.25','0.3','0.35','0.4')
ylabel('VNh0')
subplot(4,4,12)
plot(T1,rate.VPh0)
ylabel('VPh0')
legend('0.01','0.02','0.05','0.1','0.15','0.2','0.25','0.3','0.35','0.4')
subplot(4,4,13)
plot(T1,PhyN./PhyP)
ylabel('cellular N/P')
legend('0.01','0.02','0.05','0.1','0.15','0.2','0.25','0.3','0.35','0.4')
subplot(4,4,14)
plot(T1,rate.A)
ylabel('A')
legend('0.01','0.02','0.05','0.1','0.15','0.2','0.25','0.3','0.35','0.4')
 subplot(4,4,15)
 plot(T1,rate.VDOP)
 ylabel('VDOP')
 legend('0.01','0.02','0.05','0.1','0.15','0.2','0.25','0.3','0.35','0.4')
 subplot(4,4,16)
 plot(T1,rate.VDIP)
 ylabel('VDIP')
 legend('0.01','0.02','0.05','0.1','0.15','0.2','0.25','0.3','0.35','0.4')
% subplot(4,4,16)
% plot(T1,rate.lys./2.*PhyP,T,rate.lys.*PhyC./10)
% ylabel('Lysis-DOP','Lysis-DOC/10')