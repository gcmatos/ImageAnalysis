%% IMPROVE IMAGE CONTRAST
% SCRIPT FROM USER'S GUIDE MATHWORKS' IMAGE PROCESSING TOOLBOX
% SEE ALSO: imshow, image, imhist, histeq

clear all;
close all;
clc;

%% INPUT SECTION
% IMPORT
fileName = input('Insert file name: ','s');
inputImage = imread(fileName);

%% PROCESSING SECTION
% IMPROVE CONTRAST IN IMAGE USING HISTOGRAM EQUALIZATION FUNCTION
histeqImage = histeq(inputImage);
% IMPROVE CONTRAT USING imadjust
imadjustImage = imadjust(inputImage);
% image(inputImage,'CData',[0 1]);

%% DISPLAY SECTION
% DISPLAY RESULTS
figure
subplot(3,1,1),subimage(inputImage),title('inputImage')
subplot(3,1,2),subimage(histeqImage),title('histeqImage')
subplot(3,1,3),subimage(imadjustImage),title('imadjustImage')

%% OUTPUT SECTION
% EXPORT IMAGES
imwrite(histeqImage,'C:\MATLAB\ImageProcessingToolbox\output\histeqImage.tif');
imwrite(imadjustImage,'C:\MATLAB\ImageProcessingToolbox\output\imadjustImage.tif');