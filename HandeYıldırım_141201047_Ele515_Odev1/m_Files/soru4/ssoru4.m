%Hande Yıldırım,141201047,Ele515,Ödev1,Soru4

%Görev1
function cizdir = ssoru4(x0,zaman)
x0 = [1;1]; %başlangıç koşulları
zaman = 10; %T=10 s
f = @(t, x) [-x(2); x(1)+(x(1)^2-1)*x(2)]; %verilen sistemin fonksiyon cinsinden gösterimi
[~, res] = ode45(f, [0 zaman], x0); %fonksiyonun çözümü(zamansız(t'siz))
hold on
grid %figure'e grid ekleme
cizdir = plot(res(:,1), res(:,2)); %x2'nin x1'e göre değişiminin grafiğe çizimi
plot(res(1,1),res(1,2),'*') %çizilen grafiğin başlangıç noktasının * işareti ile belirtilmesi
xlabel('x1(t)');%grafiğin x ekseninin adlandırılması
ylabel('x2(t)');%grafiğin y ekseninin adlandırılması
title('x1(t) - x2(t) Grafiği')%grafiğe başlık koyulması
hold off
end

%Görev2-Başlangıç koşulu hesabı

%başlangıç koşullarını bulmak için her bir durumda verilen c değerine uygun
%olarak hesaplama yapılıyor
%result = gorev2(0.5);
%result = gorev2(1.5);
%result = gorev2(2.25);
%result = gorev2(3.0);

function result = gorev2(c)
% Soruda verilen c değerine bağlı olarak çözüm yaptırabilen bir fonksiyon
%Yazılan bu fonksiyon verilen V(x) sistemi için, yine verilmiş olan bir şartı sağlayabilen 100
%adet başlangıç koşulu vektörünü elde edebilmektedir.
syms x1 x2 %burada öncelike x1 ve x2 ileride kullanılmak amacıyla sembol olarak tanımlandı.
x = [x1; x2] %x1(t) ve x2(t) için başlangıç koşullarını bulunduran x vektörü
xtrans = x' %x vektörünün transpozesi alınmıştır.
mat = [1.5,-0.5; -0.5,1] %soruda verilen denklemdeki matrisin tanımlanması
fonk = xtrans * mat * x < c; %denklemin c'den küçük olma şartı
denk = x1 == x2; %V(x)'in max değeri bu şekilde elde ediliyor. Bunu deneme yanılma metodu ile buldum.
result = solve(fonk, denk, x, 'ReturnConditions', true, 'Real', true);
end