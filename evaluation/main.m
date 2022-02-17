%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Code by : Rubi Quinones
% This evaluation code will run one dataset at a time
% assuming you are in the root folder 'OSCCO2'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% User-Defined Variables

output_folder_name = 'output';
datarepository_folder_name = 'CosegPP_extension';
datarepository_groundtruth_folder_name = 'CosegPP_extension_ground_truth';
dataset_folder_name = 'Sunflower-D-1';

%% Evaluation

results={};

f = dir([output_folder_name, '/segmented/', datarepository_folder_name, '/', dataset_folder_name]);
f=f(~ismember({f.name},{'.','..','.DS_Store'}));
classes = {f.name};

    
for j=1:length(classes)
    disp(j);
    try
        maskDir = [output_folder_name, '/segmented/', datarepository_folder_name, '/', dataset_folder_name, '/', classes{1,j} '/'];
        gtDir = [datarepository_groundtruth_folder_name, '/', dataset_folder_name, '/', classes{1,j} '/'];
        [P,J,R,~,~,~] = evaluateSegmentation(maskDir,gtDir);

        results(j,1) = cellstr(classes{1,j});
        results(j,2) = num2cell(P);
        results(j,3) = num2cell(J);
    catch
        results(j,1) = cellstr(classes{1,j});
        results{j,2} = P;
        results{j,3} = J;
    end       
end
