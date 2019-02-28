function [colourIntersections,intersectionValue] = ICV_createHistogramIntersection(I,M,bins,normalise)
%% Function to create the Histogram Intersection given 2 input images, bins amount and normalisation boolean 

%% Definitions

% Calculate the colour channels of the input image
[~,~,channels] = size(I); 

%% Create Histograms

% Create the Histograms for both the input images
% Using the pre-built function, ICV_createHistogram
intensityCountsI = ICV_createHistogram(I,bins);
intensityCountsM = ICV_createHistogram(M,bins);

% Initialise an empty array for the histogram intersection counts 
histIntersection = zeros(bins,channels);

%% Loop through each bin and channel and calculate the histogram intersection

for i = 1:bins
    for k = 1:channels
        
        % Find the minimum intensity count from both of the input images
        intenstyCountIntersection = min(intensityCountsI(i,k),intensityCountsM(i,k));
        % Update the Histogram Intersection Array with the min intensity count
        histIntersection(i,k) = intenstyCountIntersection;
        
    end
end

%% Return the completed Histogram Intersection, normalised if required

% If normalise set to true
if normalise == true
    % Calculate the normalised intersection value for each colour channel
    redIntersections = sum(histIntersection(:,1)) / sum(intensityCountsM(:,1));
    greenIntersections = sum(histIntersection(:,2)) / sum(intensityCountsM(:,2));
    blueIntersections = sum(histIntersection(:,3)) / sum(intensityCountsM(:,3));
    
    % Represent all normalised colour intersection into a single array
    colourIntersections = [redIntersections,greenIntersections,blueIntersections];
    
    % Calculate the overall intersection value for the whole image
    % Normalise by dividing by the total pixels in image M
    intersectionValue = sum(histIntersection)/sum(intensityCountsM);
    
% If normalise not required
else
    % Represent all colour intersection value into a single array
    colourIntersections = [sum(histIntersection(:,1)),sum(histIntersection(:,2)),sum(histIntersection(:,3))];
    
    % Calculate the overall intersection value for the whole image
    intersectionValue = sum(colourIntersections);
end


end
