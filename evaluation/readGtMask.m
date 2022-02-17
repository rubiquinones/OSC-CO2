function mask = readGtMask(gtDir, imageName)


maskFile = [];
mask = [];
d = dir([gtDir, imageName '.png']);

for i=1:length(d)
    maskFile{i} = fullfile(gtDir, d(i).name);
    mask{i} = imread(maskFile{i});
end

mask = mask{i};
    