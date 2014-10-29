
%addpath('/Pulsar2/sirnam.swetha/Hog/libsvm-3.19/matlab/');

addpath('/Pulsar1/Libraries/libsvm/matlab/');
make

fall = fopen('All_Men_index.txt');
All = fscanf(fall,'%g');% read file

fneg = fopen('All_Women_index.txt');
neg = fscanf(fneg,'%g');

% length of file
filelength = numel(All);

% Hog_Features generates for the Data-set
load('Total_HogFeatures.mat');

disp('Loaded Data...\n');
Sn = [];

tmp = [];
tmp_row = [];
Im = [];
Label = []; 

%% Positive samples
for i = 1:1:filelength
    im = All(i);
%     im = 1;
    j = 315*(im-1)+1;
    tmp_row = [];
    for k = j:1:j+314
       tmp =[];
       for c = 1:1:31
            tmp = [tmp Total(k,c)];  
       end
       tmp_row = [tmp_row tmp];
    end
    Im = [Im ; tmp_row]; 
    Label = [Label ; 1];
end


disp('Loaded +ve Data...\n');
%% Negative samples

filelength_neg = numel(neg);
for i = 1:1:filelength_neg
    im = neg(i);
    j = 315*(im-1)+1;
    tmp_row = [];
    for k = j:1:j+314
       tmp =[];
       for c = 1:1:31
            tmp = [tmp Total(k,c)];  
       end
       tmp_row = [tmp_row tmp];
    end
    Im = [Im ; tmp_row]; 
    Label = [Label ; -1];
end
disp('Loaded -ve Data...\n');
Label = double(Label);
Im = double(Im);
% model = svmtrain(training_label_vector, training_instance_matrix [, 'libsvm_options']);
Model = svmtrain(Label, Im);
disp('Training...\n');

save('Total_data_1men_pos.dat','Im');
save('Label_1men_pos.dat','Label');
save('Model_1men_pos.dat','Model');
