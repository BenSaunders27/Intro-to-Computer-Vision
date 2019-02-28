function ICV_showHistogram(I)
%% Function that returns the Colour Histogram for an input image, I.

%% Definitions

% Define the colour bins for the histrogram
bins = 255;

% Generate an array from 0-bins for the plot x-axis
binX = linspace(0,bins-1,bins).';

%% Create the Histogram
% Use the pre-built function, ICV_createHistogram
intensityCounts = ICV_createHistogram(I,bins);

%% Plot the Histogram

% Ensure the plot is a single figure
subplot(1,1,1);
% Plot the Histogram, with each colour channel shown as the relevant colour
plot(binX,intensityCounts(:,1),'r',binX,intensityCounts(:,2),'g',binX,intensityCounts(:,3),'b');
% Limit the x-axis to 0-bins, to match the image intensities range
xlim([0,bins]);

% Title the histogram
title(['Histogram Plot' ])


end