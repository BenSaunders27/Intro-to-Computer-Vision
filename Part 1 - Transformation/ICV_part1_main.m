function ICV_part1_main() 
%% Function to run Part 1: Transformation
% The directory should be changed to the 'Part 1 - Transformation' folder 
% and the file 'ICV_part3_main' should be run. 
% This will load the 'Name image.png' image and perform each Rotation and 
% Skew in turn. The resulting transformed images will be printed out, with
% the Command Window prompting a key press to move to the next image transformation.

% Name image read in
I = imread("Name image.png");

% Original Name Image
imshow(I);
title('Original Name Image');
disp 'Original Name Image - Press enter to move onto Rotation';
pause;


%% Rotation

% Rotation of 30 degrees
Ir30 = ICV_rotateImg(I,30);
imshow(Ir30);
title('Rotaton of 30 degrees');
disp 'Rotation of 30 degrees - Press enter to show the next Rotation';
pause;  

% Rotation of 60 degrees
Ir60 = ICV_rotateImg(I,60);
imshow(Ir60);
title('Rotaton of 60 degrees');
disp 'Rotation of 60 degrees - Press enter to show the next Rotation';
pause; 

% Rotation of 120 degrees 
Ir120 = ICV_rotateImg(I,120);
imshow(Ir120);
title('Rotaton of 120 degrees');
disp 'Rotation of 120 degrees - Press enter to show the next Rotation';
pause; 

% Rotation of -50 degrees
Irminus50 = ICV_rotateImg(I,-50);
imshow(Irminus50);
title('Rotaton of -50 degrees');
disp 'Rotation of -50 degrees - Press enter to move to Skewing';
pause; 


%% Skewing

% Skew of 10 degrees
Is10 = ICV_skewImg(I,10);
imshow(Is10);
title('Skew of 10 degrees');
disp 'Skew of 10 degrees - Press enter to show the next Skew';
pause; 

% Skew of 40 degrees
Is40 = ICV_skewImg(I,40);
imshow(Is40);
title('Skew of 40 degrees');
disp 'Skew of 40 degrees - Press enter to show the next Skew';
pause; 

% Skew of 60 degrees
Is60 = ICV_skewImg(I,60);
imshow(Is60);
title('Skew of 60 degrees');
disp 'Skew of 60 degrees - Press enter to move onto Rotation and Skewing';
pause; 


%% Rotation and Skewing

% Rotation of 20 degrees and then a Skew of 50 degrees
Ir20 = ICV_rotateImg(I,20);
Ir20s50 = ICV_skewImg(Ir20,50);
imshow(Ir20s50);
title('Rotation of 20 degrees and then a Skew of 50 degrees');
disp 'Rotation of 20 degrees and then a Skew of 50 degrees - Press enter to show the next Rotation and Skewing';
pause; 

% Skew of 50 degrees and then a Rotation of 20 degrees
Is50 = ICV_skewImg(I,50);
Is50r20 = ICV_rotateImg(Is50,20);
imshow(Is50r20);
title('Skew of 50 degrees and then a Rotation of 20 degrees');
disp 'Skew of 50 degrees and then a Rotation of 20 degrees - Press enter to finish';
pause; 

close;





