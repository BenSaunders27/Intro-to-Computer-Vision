function ICV_part4_main()
%% Main function to portray the results of Part 4: Motion Estimation
% Run and press enter to move through the sections
clf

%% Read Video and Frames

% Read in the provided video DatasetC
V = VideoReader("DatasetC.mpg");

% Read the 20th and 21st frames
I = read(V,20);
imshow(I,'InitialMagnification',200)
title('Frame It - Frame 20');
disp 'Frame It - Press enter to move to Frame It+1';
pause;

M = read(V,21);
imshow(M,'InitialMagnification',200)
title('Frame It+1 - Frame 21');
disp 'Frame It+1 - Press enter to move to Motion Fields';
pause;

%% Part A - Display Motion Field

ICV_display_motion_field(I,M,16,20);
title('Motion Field of It+1');
disp 'Motion Field of It+1 - Press enter to move to Predicted Image';
pause;


%% Part B - Predict the next frame, Pt

% Block size of 16x16 and Search Window of 20x20
P = ICV_predict_next_frame(I,M,16,20);
imshow(P,'InitialMagnification',200)
title('Predicted image, Pt+1');
disp 'Predicted image, Pt+1 - Press enter to move to Changing Block Sizes';
pause;


%% Part C - Change the Block Size

% Block Size of 4x4
clf
P_4_16 = ICV_predict_next_frame(I,M,4,16);
imshow(P_4_16(50:150,150:270,:),'InitialMagnification',500)
title('Pt+1, with 4x4 Block and 16x16 Window');
disp 'Pt+1 with 4x4 Block and 16x16 Window - Press enter to move to Block of 8x8';
pause;

% Block Size of 8x8
P_8_16 = ICV_predict_next_frame(I,M,8,16);
imshow(P_8_16(50:150,150:270,:),'InitialMagnification',600)
title('Pt+1, with 8x8 Block and 16x16 Window');
disp 'Pt+1 with  8x8 Block and 16x16 Window - Press enter to move to Block of 16x16';
pause;

% Block Size of 16x16
P_16_16 = ICV_predict_next_frame(I,M,16,16);
imshow(P_16_16(50:150,150:270,:),'InitialMagnification',600)
title('Pt+1, with 16x16 Block and 16x16 Window');
disp 'Pt+1 with  16x16 Block and 16x16 Window - Press enter to move to Changing of Search Window';
pause;


%% Part D - Change the Search Window

% Search Window of 8x8
P_8_8 = ICV_predict_next_frame(I,M,8,8);
imshow(P_8_8(50:150,150:270,:),'InitialMagnification',600)
title('Pt+1, with 8x8 Block and 8x8 Window');
disp 'Pt+1 with  8x8 Block and 8x8 Window - Press enter to move to Window size of 16x16';
pause;

% Search Window of 16x16
P_8_16 = ICV_predict_next_frame(I,M,8,16);
imshow(P_8_16(50:150,150:270,:),'InitialMagnification',600)
title('Pt+1, with 8x8 Block and 16x16 Window');
disp 'Pt+1 with  8x8 Block and 16x16 Window - Press enter to move to Window size of 32x32';
pause;

% Search Window of 32x32
P_8_32 = ICV_predict_next_frame(I,M,8,32);
imshow(P_8_32(50:150,150:270,:),'InitialMagnification',600)
title('Pt+1, with 8x8 Block and 32x32 Window');
disp 'Pt+1 with  8x8 Block and 32x32 Window - Press enter to move to Execution Time';
pause;


%% Part E - Execution Time

% Execution Time Vs Block Size
blockSizes = [4,8,16];
windowSize = 16;
ICV_execution_time(I,M,blockSizes,windowSize)
disp 'Exection Time against Block Size - Press enter to move to Window Size';
pause;

% Execution Time Vs Window Size
blockSize = 8;
windowSizes = [8,16,32];
ICV_execution_time(I,M,blockSize,windowSizes)
disp 'Exection Time against Window Size - Press enter to finish';
pause;

end