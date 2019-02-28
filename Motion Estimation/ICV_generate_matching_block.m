function matchingBlock = ICV_generate_matching_block(I,blockCenter,blockSize)
%% Function to provide the pixel values of a matching block from a given center and size

%% Calculate the matching block dimensions

% Initialise the matching block with zeros
matchingBlock = zeros(blockSize,blockSize,3);

% blockCenter index 1 is height, index 2 is width

% Find the boundaries of the matching block height
heightStart = blockCenter(1) - (blockSize/2) + 1;
heightFinish = blockCenter(1) + (blockSize/2);

% Find the boundaries of the matching block width
widthStart = blockCenter(2) - (blockSize/2) + 1;
widthFinish = blockCenter(2) + (blockSize/2);

%% Generate the matching block from the dimensions

% Loop through the given dimensions
for i = heightStart:heightFinish
    for j = widthStart:widthFinish
        
        % If the dimension is out of bounds, keep as zero
        if i < 1 || i > size(I,1) || j < 1 || j > size(I,2)
            continue
        else
            % Copy the pixel value in the correct position in the image
            matchingBlock(i-(heightStart-1),j-(widthStart-1),:) = I(i,j,:);
        end
        
    end
end

%% Return the matching block

end