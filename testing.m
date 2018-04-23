function[euklides_result,index,matching_percentile] = testing(test_subject_image_name,mn,PC,N,signals,learning_dataset)

test_subject = im2double(imread(test_subject_image_name));
test_subject = reshape(test_subject,[],1);

%odejmujemy srednia twarz
sprawdzanyMinusSrednia = test_subject - mn;

% projekcja danych jak w algorytmie PCA ?????????
spr3 = PC' * sprawdzanyMinusSrednia;

%Sprawdzenie norma euklidesowa
euklides = ones(N,1);
for i=1:N
    euklides(i) = (norm(spr3-signals(:,i)))^2;
end
euklides = euklides';

[minE,index] = min(euklides);

% Przeksztalcenie do dokladnosci dopasowania w procentach
% Wykonywana jest normalizacja wynikow i odejmowana od 100
% 0 - minE -w przypadku dok³adnego dopasowania(takie samo zdjêcie w zbiorze testowym i treningowym)
%          po normalizacji wartosc w macierzy wynosi dok³adnie 0 dlatego odwracana jest wartoœc
maxE = max(euklides);
matching_percentile = abs(100-(100*(euklides-(0-minE))/(maxE-minE)));

euklides_result = learning_dataset(index).name;