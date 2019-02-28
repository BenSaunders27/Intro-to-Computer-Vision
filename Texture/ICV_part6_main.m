function ICV_part6_main()
%% Main function to portray the results of Part 6: Texture
clf

%% Part A - Local LBP Windows

% Read the selected image
I = imread("car-1.jpg");

% Window 2
ICV_LBP(I,32,'n',2);
disp 'LBP Window 2 - Press enter to move to Window 28';
pause;
clf('reset');

% Window 28
ICV_LBP(I,32,'n',28);
disp 'LBP Window 28 - Press enter to move to Window 32';
pause;

% Window 32
ICV_LBP(I,32,'n',32);
disp 'LBP Window 32 - Press enter to move to Global LBP Descriptor';
pause;

%% Part B - Global LBP Descriptor

% Face image
Iface1 = imread("face-1.jpg");

ICV_LBP(Iface1,32,'y');
disp 'Global LBP Descriptor - Press enter to move to the next image';
pause;

% Car image
Icar1 = imread("car-1.jpg");

ICV_LBP(Icar1,32,'y');
disp 'Global LBP Descriptor - Press enter to move to Classification';
pause;

%% Part C - Classification of Images

% Load the images to classify
Icar2 = imread("car-2.jpg");
Icar3 = imread("car-3.jpg");
Iface2 = imread("face-2.jpg");
Iface3 = imread("face-3.jpg");

% Window Size of 32
ICV_classfy_multiple_images(Icar2,Icar3,Iface2,Iface3,32)
sgtitle('Classification with a Window Size of 32')
disp 'Classification with a Window Size of 32 - Press enter to move to a decreased window size';
pause;
clf

%% Part D - Decreased Window Size

% Window Size of 16
ICV_classfy_multiple_images(Icar2,Icar3,Iface2,Iface3,16)
sgtitle('Classification with a Window Size of 16')
disp 'Classification with a Window Size of 16 - Press enter to move to an increase window size';
pause;
clf

%% Part E - Increased Window Size

% Window Size of 64
ICV_classfy_multiple_images(Icar2,Icar3,Iface2,Iface3,64)
sgtitle('Classification with a Window Size of 64')
disp 'Classification with a Window Size of 64 - Press enter to finish';
pause;

end