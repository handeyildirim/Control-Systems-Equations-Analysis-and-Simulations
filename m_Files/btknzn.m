clear
clc
%Analog Projesi Hesaplamar
% Katman 4 elle hesaplanm??t?r
A4=0.93
Rin4=102.81;
B=110;
VBEON=0.7;
VT=0.026;
%%Katman 3 Dizayn ve hesaplamalar RE5 i bulur sana
R6 =10000000;
R5 =1000000;
IC3=0.0001
IB3=IC3/B;
VTH3 = R6/(R6+R5)*30-15;
RTH3 = R6*R5/(R6+R5);
RE5=(VTH3-RTH3*IB3-VBEON-15)/(B*IB3);
if( RE5<1)
    P='RE5 i art?r'
end
VCE3=30-RE5*IC3;
if(4>VCE3)
    P='VCE3 4 voltan az s?k?nt?l?'
end
GM3=IC3/VT;
RPI3=B*VT/IC3;

%Bir önceki devreden gelen ROUT2 de?erinin 100k oldu?unu var sayd?k
ROUT2=100000;
RIB3=RPI3+(1+B)*(RE5);
RI3 = RTH3*RIB3/(RTH3+RIB3);
A3 =  ((1+B)*RE5)/(RPI3+(1+B)*(RE5))*(RI3/(RI3+ROUT2))

%?imdi ise gelen Yapt???m?z ROUT2 100k Varsay?m?n? do?rulayarak ve Buldu?umuz RIN2 de?erlerini kullanarak devreyi çözüyoruz 2.stage in de?erlerini buluyoruz
%Burda R?N2 yok sayam?yoruz bu sebebten onuda bi varsay?mla buluca??z ve
%buna göre güzel bir kazanç denk getirmeye çal??aca??z.
R4 =1000000;
R3 =100000;
IC2=0.00001
IE2=IC2;
IB2=IC2/B;
VTH2=R4/(R3+R4)*30-15;
RTH2=R3*R4/(R3+R4);
RE3=110000;
RC2= ROUT2*RE3/(RE3-ROUT2);
RE4=(VTH2-IB2*RTH2-VBEON-15)/IE2-RE3;
Vce2= 30-IC2*RC2-IE2*(RE3+RE4);
if Vce2<4
    P='VCE2 problemli'
end
if RE3<0
    P='RE3 problemli'
end
if RE4<0
    P='RE4 problemli'
end
RPI2=VT/IC2;
GM2=IC2/VT;
VPI2=RPI2*IB2;
VO=GM2*VPI2*(ROUT2*RI3)/(ROUT2+RI3);
VIN2=VPI2+GM2*VPI2*RE3;
RIN2=VIN2/IB2;
RI2=RTH2*RIN2/(RTH2+RIN2);
%%BURDA RI2 ile ROUT un aynı olduğu varsayımını yapıyoruz
ROUT1=RI2/10;
VS=(RI2+ROUT1)/RI2*VIN2;
A2=VO/VIN2
%Ve şimdi son devreye geldik.
A=500
A1=A/A2*A3*A4
VTH1=(100000/(100000+1000000))*30-15;
IE1=0.001;
IB1=IE1/B;
RE1=100001
RC1=RE1*ROUT1/(RE1-ROUT1)
A=(RI2*RC1/(RI2+RC1))/RE1