function [M,N,data,mn,learning_dataset,test_dataset] = preparing_data(learning_data_folder,test_data_folder,image_dims)

% Wczytywanie danych ucz¹cych
learning_dataset = dir(fullfile(learning_data_folder,'*.JPG'));
test_dataset = dir(fullfile(test_data_folder,'*.JPG'));

% Podaje iloœæ wczytanych zdjeæ
learning_data_num = numel(learning_dataset);

%Przygotowanie macierzy danych ucz¹cych [MN x iloscUczacych]
data = zeros(prod(image_dims), learning_data_num);

% Wczytanie obrazów ucz¹cych i konwersja na wektor [MN x 1]
for n = 1:learning_data_num   
	filename = fullfile(learning_data_folder, learning_dataset(n).name);
	img = im2double(imread(filename));
	data(:, n) = reshape(img, [], 1);
end

[M,N] = size(data);
% Obliczenie œredniej ka¿dego wiersza danych wejœciowych
mn = mean(data,2);
end
