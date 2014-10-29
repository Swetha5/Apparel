
run('/Pulsar2/sirnam.swetha/Hog/vlfeat-0.9.18/toolbox/vl_setup')

vl_version verbose
cellSize = 8 ;


max = 5000;
row = 170;
col = 120;
dim = 31;

tmp = [];
Image = [];
Total = [];

patch_row = row/cellSize;
patch_col = col/cellSize;

% find vw for each image

% %% Now represent each image as a set of Visual Word
% 
% % Each Visual Word is the feature(31D) for each patch % 120 col 170 row

for i = 1:1:max
   path = sprintf('Try_3_cropped/myntra_%d.jpg',i);
   im = uint8(imread(path));
   hog = vl_hog(single(im), cellSize, 'verbose') ;
   
   for r = 1:1:patch_row
       for c = 1:1:patch_col
           tmp = [];
           for f = 1:1:dim
               tmp = [tmp hog(r,c,f)];
           end
           Image = [Image ; tmp];
       end
   end
   
   Total = [Total ; Image];
   Image = [];

end

save('Total_HogFeatures.mat','Total');

[ IDX , D] = kmeans( Total , 500 , 'start', 'uniform', 'emptyaction', 'singleton' );

save('ClusteredIDX.mat','IDX');
save('Centres.mat','D');

%% Now gen histograms

image_clust = []; % Histogram for each Image

for i = 1:1:max
        for j = 1:1:500
                image_clust(i,j) = 0;
        end
end

k = 1;
s = double(double(uint8(patch_row))*double(uint8(patch_col)));

for i = 1:1:max
%         s = sizea(i);
        for j = k:1:k+s-1
                if IDX(j) > 0
                        image_clust(i,IDX(j)) = image_clust(i,IDX(j)) + 1;
                end
        end
        image_clust(i,:) = image_clust(i,:)./s;
        k = k + s;
end

save('Image_Hist.mat','image_clust');
