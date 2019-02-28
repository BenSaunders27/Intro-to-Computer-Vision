function ICV_rollingIntersection(V, normalise)
%% Function to visually show the Histogram Intersection values for a given video sequence, V

%% Definitions of video sequence and bins

% Calculate the number of frames within the video sequence
N = V.NumberOfFrames;

% Set the bins amount, and create an array from 0-bins for the plot x-axis
bins = 255;
binX = linspace(0,bins-1,bins).';

% Initialise the intersectionValues array
intersectionValues = [];

%% Loop through each video frame

for i = 1:(N-1)
    
    %%  Create the histograms and intersection for this and the consecutive frame
    
    % Read in both this and the consecutive frame as an image
    frame1 = read(V,i);
    frame2 = read(V,i+1);
    
    % Create the Histogram for each frame
    % Using the pre-built function ICV_createHistogram
    intensityCountsFrame1 = ICV_createHistogram(frame1,bins);
    intensityCountsFrame2 = ICV_createHistogram(frame2,bins);
    
    % Create the Histogram Intersection for the frames
    % Using the pre-built function ICV_createHistogramIntersection
    % Normalise the histogram intersection if normalise set to 'true'
    [colourIntersections,intersectionValue] = ICV_createHistogramIntersection(frame1,frame2,bins,normalise);
    
    % Append the intersectionValues array with another plot point
    intersectionValues = [intersectionValue,intersectionValues];
    
    
    % Calculate the maxIntensity value from both frame1 and frame2
    maxIntensityCount = max(max(max(intensityCountsFrame1),max(intensityCountsFrame2)));
    
    %% Plot the Histograms & Intersections on the same graph
    
    % Subplot of 3 graphs portrayed vertically
    subplot(3,1,1);
    % Plot the Histogram for frame 1, with each channel shown in the correct colour
    plot(binX,intensityCountsFrame1(:,1),'r',binX,intensityCountsFrame1(:,2),'g',binX,intensityCountsFrame1(:,3),'b');    
    % Limit the x-axis to 0-bins, to match the image intensities range
    xlim([0,bins]);
    % Limit the y-axis to max intensity count
    ylim([0,maxIntensityCount]);
    % Title the Histogram
    title(['Frame 1 Histogram - Frame ', num2str(i)])
    
    % Repeat the Histogram plotting with the frame 2 histogram
    subplot(3,1,2);
    plot(binX,intensityCountsFrame2(:,1),'r',binX,intensityCountsFrame2(:,2),'g',binX,intensityCountsFrame2(:,3),'b');
    xlim([0,bins]);
    ylim([0,maxIntensityCount]);
    title(['Frame 2 Histogram - Frame ', num2str(i+1)])
    
    % Plot the Histogram Intersection barchart on the same subplots
    subplot(3,1,3);
    % Plot the bar chart showing the Histogram Intersection
    b = bar(colourIntersections);
    % Colour the bar chart background white 
    b.FaceColor = 'flat';
    % Colour the bars their relevant Red, Green & Blue colours
    b.CData(1,:) = [1 0.8 0.8];
    b.CData(2,:) = [0.8 1 0.8];
    b.CData(3,:) = [0.8 0.8 1];
    % If normalise, set the y-axis to range [0,1]
    if normalise == true
        ylim([0,1]);
    end
    % Set the title of the Bar Chart showing the overall intersection value
    title(['Histogram Intersection with ',num2str(intersectionValue),' pixels.' ])
    
end

% Generate the final plot of the intersection values per frame
subplot(1,1,1);
plot(intersectionValues)
title('Histogram Intersection Values')


%% Function returns void

end



