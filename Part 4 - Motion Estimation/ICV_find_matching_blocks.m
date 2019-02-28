function blockCentersArray = ICV_find_matching_blocks(I,blockSize)
%% Function to generate all possible matching blocks within an image I

%% Definitions

% Determine the specifications of the image
[height, width, ~] = size(I);

% Calculate how many times the matching block goes vertically and horizontally
verticalAmount = height/blockSize;
horizontalAmount = width/blockSize;

% Initialise an array that stores all the block centers
blockCentersArray = [];

%% Generate each block center 

% Loop through each possible block position (Starting from 0 as the block
% center will be added)
for i = 0:(verticalAmount-1)
    for j = 0:(horizontalAmount-1)
        
        % Find the height of this block center using the loop and block size
        blockHeightCenter = (i*blockSize) + (blockSize/2);
        % Find the width of this block center
        blockWidthCenter = (j*blockSize) + (blockSize/2);
        
        % Combine the height and width
        blockCenter = [blockHeightCenter,blockWidthCenter];
        
        % Add this block to the full array
        blockCentersArray = [blockCentersArray;blockCenter];
        
    end
end


%% Return the array of the created block centers

end
