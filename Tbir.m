% Process the query Image
% Assume user gives the tags

Tags = [30];

%% Read Query Image

FID = fopen('result_file_Try4/TryNewImage');
A = fscanf(FID,'%u');

B=[];
size = A(1);
for k = 2: 1 : size+1
    tmp=[];
    for j=1:1:147
        tmp=[tmp A(j+(k-2)*147)];
    end
    B=[B;tmp];
end

for k = 1 : 1 : size
    for j = 1:1:49
        red = B(k,j);
        green = B(k,j+49);
        blue = B(k,j+98);
        norm = red + green + blue;
        B(k,j) = red/norm;
        B(k,j+49) = green/norm;
        B(k,j+98) = blue/norm;

    end
end

%% Centres of the clusters
FID1 = fopen('centres_Try4');
C = fscanf(FID1,'%f');

D=[];
%size = size(C)/147
for k = 1: 1 : 500
    tmp=[];
    for j=1:1:147
        tmp=[tmp C(j+(k-1)*147)];
    end
    D=[D;tmp];
end

%% knn search
IDX = knnsearch(D,B);

%% generating image_clust

for j = 1:1:500
    image_cluster(j) = 0;
end

f1id = fopen('result_file_Try4/q_words.txt','w');
for j = 1:1:size
        if IDX(j) > 0
                image_cluster(IDX(j)) = image_cluster(IDX(j))+1;
        end
       fprintf(f1id,'%d ',IDX(j));
end

query_image_sparse = sparse(image_cluster);





%% Data

fall = fopen('data_Try4.txt');
All = fscanf(fall,'%g');

fReq = fopen('outputmat.txt');
Req = fscanf(fReq,'%g');

tot = 5000;

TagMatrix = zeros(5000,31);

for i = 1:1:tot
	tmp = [];
	for j = 1:1:30
		tmp = [ tmp Req( j + (i-1)*31 )];
	end
	TagMatrix = [TagMatrix ; tmp ];
end



Image_hists = [];
for i = 1:1:tot
        tmp = [];
		% flag to check if the image has all the tags specified by user
		Tagflag = 0;
		% check if ith image has the req tags
		for index = 1:1:numel(size(Tags))
			if TagMatrix(i,index) == 1
				continue;
			else
				Tagflag = 1; 
		end
		if Tagflag == 0
	        for j = 1:1:500
    	            tmp = [ tmp All( j + (i-1)*500 ) ];
    	    end
    	    Image_hists = [ Image_hists ; tmp ];
		end
end

InvertedSparseMatrix = sparse(Image_hists);
disp(' Sparse')
%idfSparse
idfSparse = [];
for i = 1 :1:500
	idfSparse(i) = 0;
end

[i, j, s] = find(InvertedSparseMatrix);

%for [Img, Clust, count] in [i, j, s]:
for el = 1:1:numel(i)
	%find idfi
	idfSparse(j(el)) = idfSparse(j(el)) + 1;	
end

%idfSparse

idf = [];
disp('done idf ')
for val = 1:1:500
	%compute idf
	if idfSparse(val) > 0
		idf(val) = log(tot/idfSparse(val));
	else
		idf(val) = 0;
	end
end

%idf
disp('really!! ')
%tf_idf = zeros(size(Image_hists))

tf_idf = [];
for row = 1:1:766
	for col = 1:1:500
		tf_idf(row,col) = 0;
	end
end

%for [ i1, j1, s1 ] in [i, j, s]:
for el = 1:1:numel(i)
	%tf(i(el),j(el))
	tf_idf(i(el),j(el)) = s(el)*idf(j(el));
end

%%transpose
%tf_idf = transpose(tf_idf);
Sparsetf_idf = sparse(tf_idf);
disp('end')


%% Now find tf-idf for the query image
[irow, icol, scount] = find(query_image_sparse);

for el = 1:1:numel(irow)
        %find idfi
        idfSparse(icol(el)) = idfSparse(icol(el)) + 1;
end

%% idfSparse

qidf = [];
disp('Q done idf ')
for val = 1:1:500
        %compute idf
        if idfSparse(val) > 0
                qidf(val) = log((tot+1)/idfSparse(val));
        else
                qidf(val) = 0;
        end
end

%idf
disp('Q really!! ')

qtf_idf = [];

for col = 1:1:500
       qtf_idf(1,col) = 0;
end

for el = 1:1:numel(irow)
        %tf(i(el),j(el))  
        qtf_idf(irow(el),icol(el)) = scount(el)*qidf(icol(el));
end

Sparseqtf_idf = sparse(qtf_idf);

image_scores = [];
for i = 1:1:tot
        image_scores(i) = 0;
end

[ img, clust, count ] = find(Sparseqtf_idf);%query_image_sparse);

[ Image, Cluster, Counter ] = find(Sparsetf_idf);%InvertedSparseMatrix);

totalValues = nnz(Sparsetf_idf);%InvertedSparseMatrix);

for vw = 1:1:numel(img)
        
        visualWord = clust(vw);
        for tr = 1:1:totalValues
                if Cluster(tr) == visualWord
                        %increment count
                       	image_scores(Image(tr)) = image_scores(Image(tr)) + count(vw);% + Counter(tr);
                end
                if Cluster(tr) > visualWord
                        break
                %else
                %       continue
                end
        end

end

disp('Done!! :)')

[ img_score Index ] = sort(image_scores,'descend');

img_score(1:70)
Index(1:70)

%delete '/home/swetha/Documents/result.txt';
img_path = '';
fid = fopen('result_file_Try4/result.txt','w');
%fid = fopen('result.txt','w');
for i=1:70
% img_path=sprintf('Dataset_4/myntra_%03d.jpg',Index(i));
img_path=sprintf('myntra_%d.jpg',Index(i));
fprintf(fid,[img_path,'\n']);
% figure, imshow(imread(img_path));
end
