%% SECTION TITLE
% APPLY *imcontour* TO CREATE PATH(S)

%% INPUT SECTION
% IMPORT
% fileName = input('Type the selected image name to create regions: ');
% inputImage = imread(fileName);

%% SECTION TITLE
% DESCRIPTIVE TEXT
figure;
imcontour(BW,2)

props = properties(BW)
stats = regionprops(BW,properties)