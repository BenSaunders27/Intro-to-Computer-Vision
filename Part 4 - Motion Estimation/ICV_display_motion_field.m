function ICV_display_motion_field(I,M,blockSize,windowSize)
%% Function to display Motion Vectors as a set of arrows on the resultant image
% I is the reference frame, It
% M is the selected frame, It+1

%% Calculate Motion Vectors

% Calculate the array of Motion Vectors
% Using the pre-built Motion Vectors function
motionVectorsArray = ICV_generate_motion_vectors(I,M,blockSize,windowSize);

%% Display image and Motion Vectors

% Show the resultant image, It+1
imshow(M,'InitialMagnification',200); hold on;

% Show each Motion Vector as an arrow
% Using the 'quiver' function
q = quiver(motionVectorsArray(:,2),motionVectorsArray(:,1),(motionVectorsArray(:,4)-motionVectorsArray(:,2)),(motionVectorsArray(:,3)-motionVectorsArray(:,1)),0,'color',[1 1 0],'linewidth',0.5);
q.MaxHeadSize = 1000000;
q.AutoScaleFactor = 1;

%% Return void

end