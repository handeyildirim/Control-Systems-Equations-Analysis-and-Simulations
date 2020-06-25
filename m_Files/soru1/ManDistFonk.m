%Hande Yıldırım,141201047, Ödev1, 1. Soru

function [ManhattanDistance] = ManDistFonk(A,B)
%2 adet N-puzzle matrisi arasındaki Manhattan Uzaklığını hesaplayan bir
%fonksiyon

%1.N-puzzle matrisleri NxN kare matrislerdir, mesela 3x3, 4x4, 10x10, …
%2.Elemanlari [0, N^2-1] aralığında tamsayılardır.
%3.Her eleman birbirinden faklıdır.

%1.Öncelikle matrisimiz kare mi değil mi diye kontrol edelim:

[nRowA,nColA] = size(A);
[nRowB,nColB] = size(B);

if (nRowA ~= nColA) || (nRowB ~= nColB)
    disp('Matrisler Kare Değil !');
    error('Matrisler Kare olmalı');
end

%2.Daha sonra matrisin elemanlarının 0 ile N^2-1 aralığında bir tam sayı olup
%olmadığına bakalım:

Amax = max(A(:));
Bmax = max(B(:));
Amin = min(A(:));
Bmin = min(B(:));

if (Amax > nRowA^2-1) || (Bmax > nRowB^2-1)
    disp('Matrisler Manhattan Distance Hesaplamaya Uygun Değiller!');
    error('Matrisin elemanları 0 ile N^2-1 aralığında bir tam sayı olmalı');
end

if (Amin < 0) || (Bmin < 0)
    disp('Matrisler Manhattan Distance Hesaplamaya Uygun Değiller!');
    error('Matrisin elemanları 0 ile N^2-1 aralığında bir tam sayı olmalı');
end

%3. Şimdi her iki matris içinde her bir eleman birbirlerinden farklı mı 
%diye kontrol edelim:
siraliA = sort(A(:));
for i=1:length(siraliA)-1
    if A(i) == A(i+1)
        disp('Matristeki elemanlar birbirinden farklı olmak zorunda');
        error('Matristeki elemanlar birbirinden farklı değil !');
    end
end

siraliB = sort(B(:));
for j=1:length(siraliB)-1
    if B(j) == B(j+1)
        disp('Matristeki elemanlar birbirinden farklı olmak zorunda');
        error('Matristeki elemanlar birbirinden farklı değil !');
    end
end

%Şimdi Manhattan Distance bulalım:

ManhattanDistance = 0;

for i=1:nRowA %N kere bu işlem(satır)
    for j=1:nColA %N kere bu işlem(sütun)
        [row,col] = find(A == B(i,j));
        ManhattanDistance = ManhattanDistance + abs(row-i) + abs(col-j);
    end
end

end

