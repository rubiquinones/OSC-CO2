function mask = readMask(maskDir, imageName)


maskFile = [];
mask = [];
d = dir([maskDir, imageName '_*.png']);

for i=1:length(d)
    maskFile{i} = fullfile(maskDir, d(i).name);
    mask{i} = imread(maskFile{i});
end



