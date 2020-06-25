%Hande Yildirim,141201047,Ele515,Ödev1,Soru2

%Öncelikle merkezi orijin olan ve 1 yarıçaplı bir çember çizelim:
x = 0;%merkezin x koordinatı
y = 0;%merkezin y koordinatı
r = 1;%yarıçap değeri
toplam_nokta = 10e3;%simülsyon için kullanılacak toplam nokta. Bu değerler değiştirilebilir
th = 0:pi/50:2*pi;
xaxs = r * cos(th) + x;
yaxs = r * sin(th) + y;
hold on
grid
plot(xaxs, yaxs);

%Daha sonra elemanları [−1,1] aralığında değişen 2 boyutlu 1000 adet 
%rastgele vektör oluşturalım ve vektörlerin her biri için uzunluklarını(d0)
%bulalım:
x0 = -1+2*rand(toplam_nokta,1);
y0 = -1+2*rand(toplam_nokta,1);
d0 = (x0.^2 + y0.^2);

% Şimdi vektör uzunluğu, eğer r = 1 ’den büyükse siyah renk ile, küçükse 
% kırmızı renk ile şekildeki grafiğe nokta olarak çizelim. 
% Bu işlem 1000 adet vektörün hepsi için tekrarlanacaktır.
r1 = ones(toplam_nokta,1); %burada uzunlukla(d0) kıyaslama yapılabilmesi için 1000x1'lik tüm elemanları 1 olan bir matris üretildi
figure()
plot(xaxs, yaxs); %x ve y değerlerine göre grafik çizildi
hold on
grid
cember_disi_nokta = 0; %başta çember dışında hiç nokta yok
h = waitbar(0,'Cember olusuyor..'); %bekleme çubuğu başladı
for i=1:1:toplam_nokta
    waitbar(0.2, h, 'Cember disi noktalar hesaplanıp ciziliyor..');
    if d0(i) > r1(i) %çember dışındaki noktalar seçildi
        scatter(x0(i),y0(i),'filled','k')
        cember_disi_nokta = cember_disi_nokta + 1;%çember dışındaki 
        %noktalarin sayisi
    end
    waitbar(0.2, h, 'Cember ici noktalar hesaplanıp ciziliyor..');
    if d0(i) < r1(i) %çember içindeki noktalar seçildi
        scatter(x0(i),y0(i),'filled','r') %scatter komutu ile çemberin içine içi dolu noktalar çizildi
    end 
   
end

waitbar(0.4, h, 'Pi degeri hesaplaniyor..'); 
piest = (4*(toplam_nokta - cember_disi_nokta)) / toplam_nokta; %denklemi soruda verilen piest hesaplandı
title(piest); %grafiğin başlığı piestin değişkeni için bulunan değer yapıldı
hold off

waitbar(1, h, 'Son !');
pause(1); %kısacık bir bekleme, kodun kafasının karışmaması için
close(h); %bekleme çubuğu kapatıldı