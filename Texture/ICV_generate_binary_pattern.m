function binaryValue = ICV_generate_binary_pattern(lbpBlock)
%% Function to create the binary pattern of a given 3x3 LBP Block

%% Initialisations

% Get the value of the centre pixel
centrePixelValue = lbpBlock(2,2);

% Set the positions of the bit code 
% These positions are provided by the assignment - Starting top left and
% following a counter-clockwise manner
bitPositions = [[1;1],[2;1],[3;1],[3;2],[3;3],[2;3],[1;3],[1;2]];

% Initialise the Bit Code to all zeros
bitCode = zeros(1,8);

%% Generate Bit Code

% Loop through each position - using the size of the bitPositions
for i = 1:size(bitPositions,2)
    % Get this pixel position 
    bitPosition = bitPositions(:,i);
    
    % Find value of this pixel in the 3x3 block
    bitValue = lbpBlock(bitPosition(1),bitPosition(2));
    
    % If this pixel value is larger than the centre pixel
    if bitValue > centrePixelValue
        % Set the bit code for this position to 1
        bitCode(i) = 1;
    end
    
end

%% Convert to Binary

% Initialise the binary count
binaryValue = 0;

% Count the binary value of this bit code - loop through each index
for i = 1:8
    
    % Find this particular bit
    bit = bitCode(i);
    % Convert to 2 to the power of this index
    bitValue = bit * 2.^(i-1);
    % Sum up the values
    binaryValue = binaryValue + bitValue;
    
end

%% Return the binary value of this block

end