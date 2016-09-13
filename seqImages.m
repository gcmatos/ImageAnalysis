% Perform an Operation on a Sequence of Images
% This example shows how to perform an operation on a sequence of images. The example
% creates an array of images and passes the entire array to the stdfilt function to
% perform standard deviation filtering on each image in the sequence.)

%% SECTION TITLE
% Create an array of file names.
fileFolder = fullfile(matlabroot,'toolbox','images','imdata');
dirOutput = dir(fullfile(fileFolder,'AT3_1m4_*.tif'));
fileNames = {dirOutput.name}'
numFrames = numel(fileNames)
% Preallocate an m-by-n-by-p array and read images into the array.
I = imread(fileNames{1});
sequence = zeros([size(I) numFrames],class(I));
sequence(:,:,1) = I;
%
for p = 2:numFrames
sequence(:,:,p) = imread(fileNames{p});
end

%% PROCESSING SECTION
% Process each image in the sequence, performing standard deviation filtering, and view
% the results. Note that, to use stdfilt with an image sequence, you must specify the
% nhood argument, passing a 2-D neighborhood.
sequenceNew = stdfilt(sequence,ones(3));
figure;
for k = 1:numFrames
imshow(sequence(:,:,k));
title(sprintf('Original Image # %d',k));
pause(1);
imshow(sequenceNew(:,:,k),[]);
title(sprintf('Processed Image # %d',k));
pause(1);
end