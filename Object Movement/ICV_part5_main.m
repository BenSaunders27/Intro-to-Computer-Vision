function ICV_part5_main()
%% Main function to portray the results of Part 5: Objects
% Run and press enter to move through the sections
clf

%% Read Video 

% Load the video, DatasetC.mpg
V = VideoReader("DatasetC.mpg");


%% Part A - Frame Differencing with Reference frame as first frame of sequence 

% Reference Frame - First frame of sequence
M = read(V,1); 
imshow(M,'InitialMagnification',200)
title('Reference Frame - Frame 1');
disp 'Reference Frame - Frame 1 - Press enter to move to Selected Frame 10';
pause;

%% Frame 10

% Read the selected frame - Frame 10
I = read(V,10);
imshow(I,'InitialMagnification',200)
title('Selected Frame - Frame 10');
disp 'Selected Frame - Frame 10 - Press enter to move to Frame Differencing';
pause;

% Frame Differencing
[D_10, thresholdImg_10, ~] = ICV_frame_differencing_threshold(I,M,'y');

% Frame Differenced Image
imshow(D_10,'InitialMagnification',200)
title('Frame Differenced Image with Reference as first frame - Frame 10');
disp 'Frame Differenced Image - Press enter to move to Threshold Image';
pause;

% Threshold Image
imshow(thresholdImg_10,'InitialMagnification',200)
title('Threshold Image with Reference as first frame - Frame 10');
disp 'Threshold Image - Press enter to move to Frame 120';
pause;

%% Frame 120

% Read the selected frame - Frame 120
I = read(V,120);
imshow(I,'InitialMagnification',200)
title('Selected Frame  - Frame 120');
disp 'Selected Frame - Frame 120 - Press enter to move to Frame Differencing';
pause;

% Frame Differencing
[D_120, thresholdImg_120, ~] = ICV_frame_differencing_threshold(I,M,'y');

% Frame Differenced Image
imshow(D_120,'InitialMagnification',200)
title('Frame Differenced Image with Reference as first frame - Frame 120');
disp 'Frame Differenced Image - Press enter to move to Threshold Image';
pause;

% Threshold Image
imshow(thresholdImg_120,'InitialMagnification',200)
title('Threshold Image with Reference as first frame - Frame 120');
disp 'Threshold Image - Press enter to move to Reference Frame as previous frame';
pause;

%% Part B - Reference frame as previous frame

%% Frame 10

% Read the selected frame and reference frame - Frame 10
M = read(V,9);
I = read(V,10);
% Frame Differencing
[D_10, thresholdImg_10, ~] = ICV_frame_differencing_threshold(I,M,'y');

% Frame Differenced Image
imshow(D_10,'InitialMagnification',200)
title('Frame Differenced Image with Reference as Previous frame - Frame 10');
disp 'Frame Differenced Image - Press enter to move to Threshold Image';
pause;

% Threshold Image
imshow(thresholdImg_10,'InitialMagnification',200)
title('Threshold Image with Reference as Previous frame - Frame 10');
disp 'Threshold Image - Press enter to move to Frame 120';
pause;

%% Frame 120

% Read the selected frame and reference frame - Frame 10
M = read(V,119);
I = read(V,120);
% Frame Differencing
[D_120, thresholdImg_120, ~] = ICV_frame_differencing_threshold(I,M,'y');

% Frame Differenced Image
imshow(D_120,'InitialMagnification',200)
title('Frame Differenced Image with Reference as Previous frame - Frame 120');
disp 'Frame Differenced Image - Press enter to move to Threshold Image';
pause;

% Threshold Image
imshow(thresholdImg_120,'InitialMagnification',200)
title('Threshold Image with Reference as Previous frame - Frame 120');
disp 'Threshold Image - Press enter to move to Background Generation';
pause;

%% Part C - Background Generation

backgroundImg = ICV_background_generation(V);
imshow(backgroundImg,'InitialMagnification',200)
title('Background Image');
disp 'Background Image - Press enter to move to Object Detection';
pause;


%% Part D - Show Moving Object Detection

ICV_show_moving_objects(V)
disp 'Moving Object Detection - Press enter to finish';
pause;

end