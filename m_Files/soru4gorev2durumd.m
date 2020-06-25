ilk = linspace(-1.4142,1.4142,100);
son = linspace(-1.4142,1.4142,100);
x = [ilk; son];

for i = 1:100 %100 tane başlangıç koşulu oluşturulması için 100 kere döngüye girdi
    x0=[x(1,i); x(2,i)]; %x matrisinin başlangıç koşullarının matris üzerinde gösterimi
    ssoru4(x0, 0.5); %bu başlangıç koşullarını grafikte çizdirme
end
grid %figure grid ekleme
axis square;%grafiğin eksenlerini eşit uzunluklara sahip yapıp ve veri birimleri arasındaki artışları buna göre ayarlama komutu
title('V(x) < 0.5'); %figure başlık ekleme

function cizdir = ssoru4(x0,zaman)
zaman = 2.6; %T=2.6 s
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