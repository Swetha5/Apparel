% clc;
% clear;
% close all;

%% Reading images from dataset_4 and storing rgb histogram values

% imagefiles = dir('../Dataset_4/*.jpg');      
% nfiles = length(imagefiles);    % Number of files found

final =[];
for ii=1:5000
   path = sprintf('../Try_3_cropped/myntra_%d.jpg',ii);
   ii
   I = uint8(imread(path));
   nBins = 64;
   rHist = imhist(I(:,:,1), nBins);
   gHist = imhist(I(:,:,2), nBins);
   bHist = imhist(I(:,:,3), nBins);
   feature = [rHist; gHist; bHist];
   final = [final feature];
end
 
final =final';