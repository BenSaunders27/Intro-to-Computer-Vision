function sWindow = ICV_generate_search_window(I,blockCenter,windowSize)
%% Function to provide the pixel values of a search window from a given matching block center and size

%% Definitions

% Find the height and width of the block center position
blockHeightPosition = blockCenter(1);
blockWidthPosition = blockCenter(2);

%% Generate Height Boundaries

% Set the height boundaries of the search window
% 1 less pixel on the top, as the window is an even size so has no 'center'
heightStart = blockHeightPosition - (windowSize/2) + 1;
heightFinish = blockHeightPosition + (windowSize/2);

% Ensure the height boundaries are within the image size
if heightStart < 1
   heightStart = 1;
end
if heightFinish > size(I,1)
   heightFinish = size(I,1);
end

%% Generate Width Boundaries

% Set the width boundaries of the search window
% 1 less pixel on the left, as the window is an even size
widthStart = blockWidthPosition - (windowSize/2) + 1;
widthFinish = blockWidthPosition + (windowSize/2);

% Ensure the width boundaries are within the image size
if widthStart < 1
   widthStart = 1;
end
if widthFinish > size(I,2)
   widthFinish = size(I,2);
end

%% Generate the final Search Window

% Use the boundaries generated to create the final search window
sWindow = I(heightStart:heightFinish,widthStart:widthFinish,:);

%% Return the created search window

end