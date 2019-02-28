function position = ICV_check_search_window(matchingBlock,searchWindow,blockSize,windowSize,referenceMBlock)
%% Function to check for the likeliest place for the matching block in the search window
% Loop through a search window and find the lowest error for matching block

%% Definitions

% Determine the specifications of the matching block and search window
[mBlockHeight, mBlockWidth, ~] = size(matchingBlock);
[sWindowHeight, sWindowWidth, ~] = size(searchWindow);

% Calculate the amount of times the matching block fits into the search window
loopHeight = sWindowHeight - mBlockHeight + 1;
loopWidth = sWindowWidth - mBlockWidth + 1;

% Determine the differences between the positions provided by the matching 
% block and the search window 
diff = (windowSize - blockSize)/2 + 1;

% Differences used at the edges, where the search window is less than the
% window size, as the block is at the edge
heightDiff = ((sWindowHeight - mBlockHeight)/2 );
widthDiff = ((sWindowWidth - mBlockWidth)/2 );

% Initialise the lowest error to that of the centre block - to ensure this is used in ties
lowestError = ICV_mean_squared_error(matchingBlock,referenceMBlock) - 10;
% Initialise the position to the middle position
position = [0,0];

%% Find the error for each matching block position in the search window

% Loop through each position the matching block can be in the search window
for i = 1:loopHeight
    for j = 1:loopWidth
        
        % Generate the new checking block in the search window
        checkBlock = searchWindow(i:i+mBlockHeight - 1,j:j+mBlockWidth - 1,:);
        
        % Calculate the error of this checking block against the matching block
        sumSquaredError = ICV_mean_squared_error(matchingBlock,checkBlock);
        
        % If this sum of squared errors is lower than the lowest
        if sumSquaredError < lowestError
            % Set the new lowestError
            lowestError = sumSquaredError;
            
            % Record the pixel position of this lowest sum squared errors
            position = [i - diff ,j - diff ]; 
            
            % If the block in corner, require varying amendments
            if sWindowHeight < windowSize || sWindowWidth < windowSize
                position = [i - heightDiff - 1, j - widthDiff - 1];
                
                % Amendment amounts for the edges
                heightAmend =  (sWindowHeight - blockSize)/2;
                widthAmend = (sWindowWidth - blockSize)/2;
                
                if i == 1 % Top row of the image
                    position(1) = position(1) + heightAmend;
                elseif i == loopHeight % Bottom row
                    position(1) = position(1) - heightAmend;
                end  
                    
                if j == 1 % Left column
                    position(2) = position(2) + widthAmend;
                elseif j == loopWidth % Right column
                    position(2) = position(2) - widthAmend;
                end 
            end 
        end 
    end
end

%% Return the position the matching block has moved to

end
