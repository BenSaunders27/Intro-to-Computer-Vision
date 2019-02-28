function ICV_part2_main()
%% Function to run Part 2: Filtering and Convolution
% The directory should be changed to the 'Part 2 - Filtering & Convolution' 
% folder and the file 'ICV_part2_main' should be run. 
% This will load the 'car-2.jpg' image and the relevant kernels required. 
% Each kernel filtering will be processed in turn. The resulting filtered 
% images will be printed out, with the Command Window prompting a key press 
% to move to the next image filtering.

% Load the Kernels to be used in the filtering
ICV_kernels

% Original Image
I = imread("car-2.jpg");
imshow(I);
title('Original Image');
disp 'Original Image - Press enter to move onto Average Image';
pause;

%% Average Filtering

% Average Image
averageI = ICV_convolutionFilter(I,averageKernel);
imshow(averageI);
title('Averaged Image');
disp 'Averaged Image - Press enter to move onto Kernel A 3x3';
pause;


%% Kernel A & B - 3x3

% Kernel A 3x3 Image
a3I = ICV_convolutionFilter(I,a3Kernel);
imshow(a3I);
title('Kernel A 3x3 Image');
disp 'Kernel A 3x3 Image - Press enter to move onto Kernel B 3x3';
pause;

% Kernel B 3x3 Image
b3I = ICV_convolutionFilter(I,b3Kernel);
imshow(b3I);
title('Kernel B 3x3 Image');
disp 'Kernel B 3x3 Image - Press enter to move onto Kernel A 3x3 followed by Kernel A 3x3';
pause;

% Kernel A 3x3 followed by Kernel A 3x3
a3I = ICV_convolutionFilter(I,a3Kernel);
a3a3I = ICV_convolutionFilter(a3I,a3Kernel);
imshow(a3a3I);
title('Kernel A 3x3 followed by Kernel A 3x3');
disp 'Kernel A 3x3 followed by Kernel A 3x3 - Press enter to move onto Kernel A 3x3 followed by Kernel B 3x3';
pause;

% Kernel A 3x3 followed by Kernel B 3x3
a3I = ICV_convolutionFilter(I,a3Kernel);
a3b3I = ICV_convolutionFilter(a3I,b3Kernel);
imshow(a3b3I);
title('Kernel A 3x3 followed by Kernel B 3x3');
disp 'Kernel A 3x3 followed by Kernel B 3x3 - Press enter to move onto Kernel B 3x3 followed by Kernel A 3x3';
pause;

% Kernel B 3x3 followed by Kernel A 3x3
b3I = ICV_convolutionFilter(I,b3Kernel);
b3a3I = ICV_convolutionFilter(b3I,a3Kernel);
imshow(b3a3I);
title('Kernel B 3x3 followed by Kernel A 3x3');
disp 'Kernel B 3x3 followed by Kernel A 3x3 - Press enter to move onto 5x5 Kernels';
pause;

%% 5x5 Kernels

% Kernel A 5x5 followed by Kernel A 5x5
a5I = ICV_convolutionFilter(I,a5Kernel);
a5a5I = ICV_convolutionFilter(a5I,a5Kernel);
imshow(a5a5I);
title('Kernel A 5x5 followed by Kernel A 5x5');
disp 'Kernel A 5x5 followed by Kernel A 5x5 - Press enter to move onto Kernel A 5x5 followed by Kernel B 5x5';
pause;

% Kernel A 5x5 followed by Kernel B 5x5
a5I = ICV_convolutionFilter(I,a5Kernel);
a5b5I = ICV_convolutionFilter(a5I,b5Kernel);
imshow(a5b5I);
title('Kernel A 5x5 followed by Kernel B 5x5');
disp 'Kernel A 5x5 followed by Kernel B 5x5 - Press enter to move onto Kernel B 5x5 followed by Kernel A 5x5';
pause;

% Kernel B 5x5 followed by Kernel A 5x5
b5I = ICV_convolutionFilter(I,b5Kernel);
b5a5I = ICV_convolutionFilter(b5I,a5Kernel);
imshow(b5a5I);
title('Kernel B 5x5 followed by Kernel A 5x5');
disp 'Kernel B 5x5 followed by Kernel A 5x5 - Press enter to move onto 7x7 Kernels';
pause;

%% 7x7 Kernels

% Kernel A 7x7 followed by Kernel A 7x7
a7I = ICV_convolutionFilter(I,a7Kernel);
a7a7I = ICV_convolutionFilter(a7I,a7Kernel);
imshow(a7a7I);
title('Kernel A 7x7 followed by Kernel A 7x7');
disp 'Kernel A 7x7 followed by Kernel A 7x7 - Press enter to move onto Kernel A 7x7 followed by Kernel B 7x7';
pause;

% Kernel A 7x7 followed by Kernel B 7x7
a7I = ICV_convolutionFilter(I,a7Kernel);
a7b7I = ICV_convolutionFilter(a7I,b7Kernel);
imshow(a7b7I);
title('Kernel A 7x7 followed by Kernel B 7x7');
disp 'Kernel A 7x7 followed by Kernel B 7x7 - Press enter to move onto Kernel B 7x7 followed by Kernel A 7x7';
pause;

% Kernel B 7x7 followed by Kernel A 7x7
b7I = ICV_convolutionFilter(I,b7Kernel);
b7a7I = ICV_convolutionFilter(b7I,a7Kernel);
imshow(b7a7I);
title('Kernel B 7x7 followed by Kernel A 7x7');
disp 'Kernel B 7x7 followed by Kernel A 7x7 - Press enter to finish';
pause;

clear;






