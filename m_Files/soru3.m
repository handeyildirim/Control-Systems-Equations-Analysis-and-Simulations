turev(1, 300, 2500, 1000, 5000, 2000);
for i=1:5
   turev(2, perturb_parameter(300, 10), perturb_parameter(2500, 10), perturb_parameter(1000, 10), perturb_parameter(5000, 10), perturb_parameter(2000, 10)); 
end

function turev(Kd1, Kd2, M1, M2, Ks, tut)
%Bir Sistemi verilen başlangıç değerleri için, T = 500 s'de simüle etmek 
%için kullanılan bir kod 

F=1000;
syms x1(t) v1(t) x2(t) v2(t)
% Öncelikle verilen denklemdeki matrisleri aşağıdaki şekilde yazalım:
x = [x1; v1; x2; v2];
A = [0 1 0 0 ; -Ks/M1 -Kd1/M1 Ks/M1 Kd1/M1 ; 0 0 0 1 ; Ks/M2 Kd2/M2 -2*Ks/M2 -Kd2/M2];
B = [0; 1/M1; 0; 0] * F;
%Bu matris denklemini bir difarensiyel denklem olarak A*x+B şeklinde yazabiliriz.
denk = diff(x) == A*x + B;
S = dsolve(denk, x(0)==[1;0.8;0.1;0.4]); %matris içindeki vektörlerin başlangış değerleri 

cozx1 = real(simplify(vpa(S.x1)));
cozv1 = real(simplify(vpa(S.v1)));
cozx2 = real(simplify(vpa(S.x2)));
cozv2 = real(simplify(vpa(S.v2)));

figure(tut)
subplot(4,1,1)
hold on
grid
fplot(cozx1,[0 500])
hold off
xlabel('t(s)')
ylabel('x1')

subplot(4,1,2)
hold on
grid
fplot(cozv1,[0 500])
hold off
xlabel('t(s)')
ylabel('v1')

subplot(4,1,3)
hold on
grid
fplot(cozx2,[0 500])
hold off
xlabel('t(s)')
ylabel('x2')

subplot(4,1,4)
hold on
grid
fplot(cozv2,[0 500])
hold off
xlabel('t(s)')
ylabel('v2')
end

function perturbed_value = perturb_parameter(nominal_parameter_value, devPercentage)
r = nominal_parameter_value*devPercentage/100;
perturbed_value = nominal_parameter_value -r + 2*r*rand();
end