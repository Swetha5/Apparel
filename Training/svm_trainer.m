clc;
clear all;

%%
addpath('/home/swetha/Downloads/libsvm-3.19/matlab/');

% addpath('/Pulsar1/Libraries/libsvm/matlab/');
make

fall = fopen('Workspace/Training/pos_samp/P1men_index.txt');
All = fscanf(fall,'%g');% read file

fneg = fopen('Workspace/Training/pos_samp/P1women_index.txt');
neg = fscanf(fneg,'%g');

% length of file
filelength = numel(All);

load('Image_Hist.mat');

disp('Loaded Data...\n');
tmp_row = [];
Im = [];
Label = []; 

%% Positive samples
for i = 1:1:filelength
    im = All(i);
    tmp_row = [];
    for k = 1:1:500
       tmp_row = [tmp_row image_clust(i,k)];
    end
    Im = [Im ; tmp_row]; 
    Label = [Label ; 1];
end


disp('Loaded +ve Data...\n');
%% Negative samples

filelength_neg = numel(neg);
for i = 1:1:filelength_neg
    im = neg(i);
    tmp_row = [];
    for k = 1:1:500
       tmp_row = [tmp_row image_clust(i,k)];
    end
    Im = [Im ; tmp_row]; 
    Label = [Label ; -1];
end
disp('Loaded -ve Data...\n');
Label = double(Label);
Im = double(Im);
% model = svmtrain(training_label_vector, training_instance_matrix [, 'libsvm_options']);
Model = svmtrain(Label, Im,'-b 1');
[predict_label, accuracy, dec_values] = svmpredict(Label, Im, Model,'-b 1');

% save('Total_data_1men_pos.mat','Im');
% save('Label_1men_pos.mat','Label');
% save('Model_1men_pos.mat','Model');
