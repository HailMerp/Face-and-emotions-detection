clear all;
close all;

% Foldery z ktorych bierzemy dane uczace i testowe
learning_data_folder = '.\learning_data\';
test_data_folder = '.\test_data\';

%wymiary obrazow
image_dims=[200,150];
%wczytywanie obrazow do struktur i obrobka przed PCA
[M,N,data,mn,learning_dataset,test_dataset] = preparing_data(learning_data_folder,test_data_folder,[200,150]);

%-------------------------------------------------------------------------------
% PCA 

[signals,PC,V, data] = pca1(data);

% normalization to [0,1] compartment
temp = PC;
for i=1:N
   temp(:,i) = temp(:,i) - min(temp(:,i));
   temp(:,i) = temp(:,i)/ max(temp(:,i));
end

%Wyswietlenie zbioru eigenfaces
pnm = reshape(temp,200,150 * N);
figure(1)
subplot(411)
imshow(pnm(:,1:900));
subplot(412)
imshow(pnm(:,901:1800));
subplot(413)
imshow(pnm(:,1801:2700));
subplot(414)
imshow(pnm(:,2701:3600));
figure(2)

% %% 2 Sprawdzenie
% % Wczytanie czy obrazu testowego

test_subject_image_name = 'test_data\face_test_1.JPG';
[euklides_result,index,matching_percentile] = testing(test_subject_image_name,mn,PC,N,signals,learning_dataset);


%------------------------------------Plotting
names_matched = {'Jan','Marta','Nadia','Jolanta','Magda','Marek','Agata','Dorota'};
names_processed = {'Agata','Dorota','Magda','Marek','Nadia','Jolanta','Marta','Jan'};

plotting_results(names_processed,names_matched,learning_data_folder,test_subject_image_name,index,matching_percentile,euklides_result)