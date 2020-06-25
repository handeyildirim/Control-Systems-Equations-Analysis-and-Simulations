%Hande Yildirim,141201047,Ele515,Ödev1,Soru3
%% Gorev 3:

%Aşağıdaki fonksiyonu kullanarak verilen parametrelerin her birini, yüzde 10 oranında
%pertürbe edip, sistem simülasyonunu 5 defa art arda(pertürbe edilmiş bu parametre değerleri
%için) tekrarlayan (aynı süre ve aynı başlangıç koşulu için) bir kod.

turev(1, 300, 2500, 1000, 5000, 2000); %En baştaki parametrelerle cizim yapabilmek için.

for i = 1:5 %turev fonksiyonunu kullanarak 5 kere loopa girip tüm parametreleri pertürbe eder.
   turev(2, perturb_parameter(300, 10), perturb_parameter(2500, 10), perturb_parameter(1000, 10), perturb_parameter(5000, 10), perturb_parameter(2000, 10)); 
end

%% Gorev 1:
function turev(tut, M1, M2, Ks, Kd1, Kd2)
syms x1(t) v1(t) x2(t) v2(t)
F=1000;
x=[x1; v1; x2; v2];
A=[0,1,0,0 ; -Ks/M1,-Kd1/M1,Ks/M1,Kd1/M1 ; 0,0,0,1 ; Ks/M2,Kd2/M2,-2*Ks/M2,-Kd2/M2];
B=[0; 1/M1; 0; 0]*F;
denk = diff(x)==A*x+B; %Bu matris denklemini bir difarensiyel denklem olarak A*x+B şeklinde yazabiliriz.
S = dsolve(denk, x(0)==[1;0.8;0.1;0.4]); %x matrisi içindeki vektörlerin başlangıç değerleri 

resx1 = real(simplify(vpa(S.x1))); %Bu kısımda çözüm yapılırken  başta "vpa" ve "real" komutları kullanarak çözüm yapmaya çalıştım fakat hiç bir şeklide çıktı alamadım
resv1 = real(simplify(vpa(S.v1))); %Bu nedenle arkadaşıma sorarak bu komutları öğrendim ve bunları fonksiyonumda kullandım
resx2 = real(simplify(vpa(S.x2)));
resv2 = real(simplify(vpa(S.v2)));

figure(tut)
subplot(4,1,1)
hold on
grid
fplot(resx1,[0 500])
hold off
xlabel('t(s)')
ylabel('x1')
subplot(4,1,2)
hold on
grid
fplot(resv1,[0 500])
hold off
xlabel('t(s)')
ylabel('v1')
subplot(4,1,3)
hold on
grid
fplot(resx2,[0 500])
hold off
xlabel('t(s)')
ylabel('x2')
subplot(4,1,4)
hold on
grid
fplot(resv2,[0 500])
hold off
xlabel('t(s)')
ylabel('v2')
end

%% Gorev 2: 

%Girişler: 
%nominal_parameter_value: sistemin, araştırılacak parametresinin nominal değeri.
%devPercentage: Nominal parametrenin maksimum değişme yüzdesi.
%Çıktılar:
%perturbed_value: devPercentage yüzdesi ile rastgele pertürbe edilmiş
%parametrenin değeri. 

function [perturbed_value] = perturb_parameter(nominal_parameter_value,devPercentage)
val = devPercentage - 2 * devPercentage * rand(1);
Fark = val/100 * nominal_parameter_value; %Fark'ın nominal yüzdesi alınarak aradaki değişim miktarı hesaplanmıştır.
perturbed_value = Fark + nominal_parameter_value;
end