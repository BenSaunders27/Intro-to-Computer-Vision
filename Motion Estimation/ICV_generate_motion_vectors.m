function motionVectorsArray = ICV_generate_motion_vectors(I,M,blockSize,windowSize)
%% Function to generate the Motion Vectors between two images
% I is the reference frame, It
% M is the selected frame, It+1

%% Definitions

% Calculate the matching Block Centers of the given image 
blockCentersArray = ICV_find_matching_blocks(I,blockSize);

% Initialise the Motion Vectors array
motionVectorsArray = [];

%% Generate the Motion Vector for each Block Center

% Loop through each Block Center in the original image
for i = 1:size(blockCentersArray,1)
    % Find the particular Block Center
    blockCenter = blockCentersArray(i,:);
    
    % Generate the Matching Block of this Block Center, from the first image
    % Using the pre-built matching block function
    mBlock = ICV_generate_matching_block(I,blockCenter,blockSize);
    referenceMBlock = ICV_generate_matching_block(M,blockCenter,blockSize);
    
    % Generate the Search Window of this Block Center, from the second image
    % Using the pre-built search window function
    sWindow = ICV_generate_search_window(M,blockCenter,windowSize);
    
    % Find the best match for the Matching Block in the Search Window
    % Using the pre-built search window checking function
    position = ICV_check_search_window(mBlock,sWindow,blockSize,windowSize,referenceMBlock);
    
    % Store these final motion vector positions
    vectorPosition = [position(1)+blockCenter(1),position(2)+blockCenter(2)];
    
    % Record the Motion Vector as Block Center and position it has moved to
    motionVector = [blockCenter(1),blockCenter(2),vectorPosition(1),vectorPosition(2)];
    
    % Add this Motion Vector to the total array
    motionVectorsArray = [motionVectorsArray ; motionVector];
    
end

%% Return the Motion Vector array

end