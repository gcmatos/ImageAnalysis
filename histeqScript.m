%% IMPROVE IMAGE CONTRAST
% SCRIPT FROM USER'S GUIDE MATHWORKS' IMAGE PROCESSING TOOLBOX
% SEE ALSO: imshow, image, imhist, histeq

clear all;
close all;
clc;

%% INPUT SECTION
% IMPORT
inputImage = imread('LAM_AFLOR_P-23_25_46_crop.tif');

%% PROCESSING SECTION
% IMPROVE CONTRAST IN IMAGE USING HISTOGRAM EQUALIZATION FUNCTION
histeqImage = histeq(inputImage);
% IMPROVE CONTRAT USING imadjust
imadjustImage = imadjust(inputImage);
imshow(inputImage);
% DISPLAY RESULT
figure
subplot(2,2,1);
imshow(inputImage); 
image(inputImage); axis image
title('Input Image')
subplot(2,2,2);
imshow(histeqImage);
image(histeqImage); axis image
title('Output Image')
subplot(2,2,3);
imhist(inputImage);
title('Input Image Histogram')
subplot(2,2,4);
imhist(histeqImage);
title('Output Image Histogram')

%% OUTPUT SECTION
% EXPORT IMAGE
imwrite(histeqImage,'C:\MATLAB\ImageProcessingToolbox\output\histeqImage.tif');
