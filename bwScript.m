%% CREATE A BINARY VERSION OF A GRAY SCALE IMAGE
% AUTHOR: GABRIEL
% SEE ALSO: im2bw, graythresh, bwareaopen
% 
%% INPUT SECTION
% Import file typing the name of selected enhanced image (Workspace Name)
fileName = input('Type the selected image name to convert into BW: ','s');
inputImage = imread(fileName);

%% PROCESSING SECTION
% MEASURE THRESHOLD LEVEL AUTOMATICALLY
autoLevel = graythresh(inputImage);
% DEFINE THRESHOLD LEVEL MANUALLY
BW = im2double(inputImage); % convert image into double
imtool(BW) % open imtool for pixel level measurement
manLevel = input('Cutoff pixel value for binarization: '); % enter pixel level
% Convert grayscale image into binary and turn black into white using logical operation =~
BWAuto = im2bw(BW,autoLevel); BWAuto2 =~ BWAuto; 
BWMan = im2bw(BW,manLevel); BWMan2 =~ BWMan;
% DISPLAY
figure
subplot(2,2,1),subimage(BWAuto),title('BWAuto')
subplot(2,2,2),subimage(BWAuto2),title('BWAuto2')
subplot(2,2,3),subimage(BWMan),title('BWMan')
subplot(2,2,4),subimage(BWMan2),title('BWMan2')

%% POST-PROCESSING SECTION 
% CHOOSE IMAGE
BW = input('Type name of the selected BW image: ');
% APPLY bwareaopen TO FILL HOLES
BWOpen = bwareaopen(BW,input('Number of pixels for bwareaopen [1 4000]: '));
% DISPLAY bwareaopen
figure
subplot(2,1,1),subimage(BWOpen),title('BWOpen')
% APPLY imclose TO SMOOTH THE EDGES
nhood = true(input('Type nhood syze [1 inf]: '));
BWClose = imclose(BWOpen,nhood);
% Display imclose
subplot(2,1,2),subimage(BWClose),title('BWClose')

%% OUTPUT SECTION
% Export BW image
imwrite(BW,'C:\MATLAB\ImageProcessingToolbox\output\BW.tif');

