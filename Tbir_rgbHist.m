% clc;
% clear;
% close all;

Tags = [1 14];
ImageIndex = 4356;
%% generate features

path = '../Try_3_cropped/myntra_4356.jpg';
I = imread(path);
nBins = 64;
rHist = imhist(I(:,:,1), nBins);
gHist = imhist(I(:,:,2), nBins);
bHist = imhist(I(:,:,3), nBins);
query_feature = [rHist; gHist; bHist];

%% knn search in reduced search space

fReq = fopen('Outputmat.txt');
Req = fscanf(fReq,'%u');

tot = 5000;

% Build the Tag Matrix
TagMatrix = [];

for i = 1:1:tot
	tmp = [];
	for j = 1:1:31
		tmp = [ tmp Req( j + (i-1)*31 )];
	end
	TagMatrix = [TagMatrix ; tmp ];
end

%%  Reduce the search space

Test = [];
reduce = [];
% search space size is search_size
search_size = 0;

for i = 1:1:tot
    Tagflag = 0;
    tmp = [];
    for index = 1:1:numel(Tags)
        if TagMatrix(i,index) ~= TagMatrix(ImageIndex,index)
            Tagflag = 1;
        end
    end
    if Tagflag == 0
        
    	reduce = [ reduce ; final(i,:) ];
        Test = [ Test; i];
        search_size = search_size + 1;
%       TagMatrix(i,:) 
    end
end


%
id = knnsearch(reduce,query_feature','k',20)

actual = [];

for e = 1:1:numel(id)
   actual(e) = Test(id(e));
end
actual

%% get top 20 images based on dist with feature vector
%  [m id] = min(D)
 

% im =[];
% 
% for i = 1:1:5000
%     if(idx(i)==id)
%         im = [im ; i];
%     end
% end
% 

 
 
 