function [] = plotting_results(names_processed,names_matched,learning_data_folder,test_subject_image_name,index,matching_percentile,euklides_result)

in = 1;
for i = 1:8
    processed_subject_names(in:in+5,1)=names_processed(i);
    in=in+4;
end

in = 1;
for i = 1:8
    matched_subject_names(in:in+5,1)=names_matched(i);
    in=in+6;
end


subject_image = imread(test_subject_image_name);
%getting the number of matched image
number_of_processed_image = regexp(test_subject_image_name,['\d+'],'match');

subplot(121)
imshow(subject_image)
title('Przetwarzany obraz')
xlabel({'Imie osoby:',processed_subject_names{str2num(number_of_processed_image{1})}});



result_filename = [learning_data_folder,euklides_result];
matched_image = imread(result_filename);
%getting the number of matched image
number_of_matched_image = regexp(euklides_result,['\d+'],'match');
 
subplot(122)
imshow(matched_image)
title('Dopasowany obraz')
xlabel({'Procent dopasowania:',matching_percentile(index), 'Imie osoby:',matched_subject_names{str2num(number_of_matched_image{1})}  });
