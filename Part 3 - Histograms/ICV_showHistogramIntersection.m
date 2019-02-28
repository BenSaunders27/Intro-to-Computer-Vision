function ICV_showHistogramIntersection(I,M,normalise)
%% Function to create and show the Histogram Intersection for given images, I & M, and normalisation term

%% Definition
% Define the bin amount
bins = 255;

%% Create the Histogram Intersection
% Using the pre-built function, ICV_createHistogramIntersection
[colourIntersections,intersectionValue] = ICV_createHistogramIntersection(I,M,bins,normalise);

%% Plot the Histogram Intersection

% Plot the Histogram Intersection as a bar chart
subplot(1,1,1);
b = bar(colourIntersections);
b.FaceColor = 'flat';
% Colour each bar chart in the relevant colour
b.CData(1,:) = [1 0.8 0.8];
b.CData(2,:) = [0.8 1 0.8];
b.CData(3,:) = [0.8 0.8 1];

% If normalise is on, limit the y-axis to the range [0,1]
if normalise == true
    ylim([0,1]);
end

% Set title of the plot to show the number of pixels that match
title(['Histogram Intersection with ',num2str(intersectionValue),' pixels.' ])

end