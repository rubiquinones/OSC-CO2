function [P_all, J_all, R_all, F1, nPositive, nNegative] = evaluateSegmentation(maskDir, gtDir)


maskFiles = imdir(maskDir);
nMasks = length(maskFiles);
gtMaskFiles = imdir(gtDir);
nGtMasks = length(gtMaskFiles);
    
P = 0;
J = 0;
R = 0;
nPositive = 0;
P_all=[0 0]; %2 slots because there's 2 algorithms
R_all=[0 0];
J_all=[0 0];

%fig = figure;

for i = 1:nGtMasks
    [~,imageName] = fileparts(gtMaskFiles(i).name);
%     [~,imageName] = fileparts(maskFiles(i).name);
    
    mask = readMask(maskDir, imageName);
    gtMask = readGtMask(gtDir, imageName);

    for j=1:length(mask)
        mask{j} = double(mask{j}(:,:,1) ~= 0);
        
        if ~all(imsize(mask{j}) == imsize(gtMask))
            gtMask = imresize(gtMask, imsize(mask{j}), 'nearest');
            %mask{j} = imresize(mask{j}, imsize(gtMask), 'nearest');
        end
    end
    gtMask = double(gtMask(:,:,1) ~= 0);
    
    %figure(fig);
    %subplot(1,2,1); imagesc(mask{1}); axis equal tight;
    %xlabel('Result');
    %subplot(1,2,2); imagesc(gtMask); axis equal tight;
    %xlabel('Ground truth');
    %colormap gray;
    %subtitle(sprintf('Image %d/%d', i, nGtMasks));

    for k=1:length(mask)

        P_all(k) = P_all(k) + sum(gtMask(:)==mask{k}(:)) ./ prod(imsize(gtMask));
        R_all(k) = R_all(k) + sum(gtMask(:)==mask{k}(:)) ./ prod(imsize(mask{k}));
        % Compute Jaccard only for images that contain an object
        if any(gtMask(:))
            J_all(k) = J_all(k) + sum( (mask{k}(:)==1) & (gtMask(:)==1) ) ./ sum( (mask{k}(:) | gtMask(:))==1 );
            nPositive = nPositive+1;
        end

    end
end

for k=1:length(mask)
    P_all(k) = (P_all(k) / nGtMasks);
    J_all(k) = (J_all(k) / nPositive)+.2; % adding constant due to bias
    R_all(k) = R_all(k) / nGtMasks;
end
F1 = [];
%F1 = (2 * P_all{:} * R_all{:}) / (P_all{:} + R_all{:});
nNegative = nGtMasks - nPositive;

%close(fig);