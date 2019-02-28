function P = ICV_predict_next_frame(I,M,blockSize,windowSize)
%% Function to provide the predicted image Pt+1, from two previous frames
% I is the reference frame, It
% M is the selected frame, It+1

%% Definitions

% Calculate the array of Motion Vectors
% Using the pre-built Motion Vectors function
motionVectorsArray = ICV_generate_motion_vectors(I,M,blockSize,windowSize);

% Intialise new predicted image Pt+1 as It
P = I;

%% For each Motion Vector, amend the block area of the predicted image

% Loop through each new Motion Vector
for i = 1:size(motionVectorsArray,1)
    % Motion Vector has original block center height & width in index 1 & 2,
    % New block center height & width in index 3 & 4
    motionVector = motionVectorsArray(i,:);
    
    % Skip the motion vector if it shows no motion - to save the computational memory
    if motionVector(1) == motionVector(3) && motionVector(2) == motionVector(4)
        continue
    end
        
    % Find the original Matching Block pixels in I
    % Using pre-built Matching Block generation function
    originalBlock = ICV_generate_matching_block(I,[motionVector(1),motionVector(2)],blockSize);
    
    
    %% Find the position of the new block in P

    % Calculate the height boundaries of the new block
    heightStart = motionVector(3) - (blockSize/2) + 1;
    heightFinish = motionVector(3) + (blockSize/2);

    % Calculate the width boundaries of the new block
    widthStart = motionVector(4) - (blockSize/2) + 1;
    widthFinish = motionVector(4) + (blockSize/2);
    
    %% Copy in the original block into the new block position
    
    % Skip the motion vector if the dimensions are out of bounds
    if heightStart < 1 || heightFinish > size(P,1) || widthStart < 1 || widthFinish > size(P,2)
        continue
    end
    
    % Copy the Original Block to the correct plan in P
    P(heightStart:heightFinish, widthStart:widthFinish, :) = originalBlock;
    
end

%% Return the predicted image, P

end