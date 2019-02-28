function meanSquaredError = ICV_mean_squared_error(matchingBlock,check)
%% Function to calculate the Mean Squared Error of a given matching block and checking block

%% Definitions

% Amend datatype to double, in order to create calculations above 8-bit
matchingBlock = double(matchingBlock); check = double(check);

% Determine the specifications of the matching block 
% Presume both the blocks are the same specifications
[height, width, channels] = size(matchingBlock);

%% Calculate sum squared error between blocks using vectorwise multiplication

% Calculate the difference between blocks in vector form
differenceVector = (matchingBlock(:) - check(:));
% Calculate the Dot Product of the difference vector - which is the sum of squared errors
% Use this instead of a for loop as more efficient
sumSquaredErrors = sum(differenceVector.*differenceVector);

%% Find the mean of these errors

% Average the errors by dividing by all pixels
meanSquaredError = sumSquaredErrors/(height*width*channels);

%% Return the mean of the squared errors

end