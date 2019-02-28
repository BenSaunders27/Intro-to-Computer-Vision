function globalHistogramValues = ICV_LBP(I,windowSize,globalFlag, windowNumber)
%% Function to generate the Local Binary Patterns of an image, given a window size 

% If the arguments are less than 4, initialise a window number - not used if global
if nargin < 4
   windowNumber = 1;
end

%% Turn the provided image into greyscale

% Check if the image is not greyscale, and convert it not
if size(I,3)>1
    
    % Convert the image to a double format, to allow larger than 255
    I = double(I);

    % Convert to a greyscale by averaging over the three colour channels and rounding down
    I = floor((I(:,:,1) + I(:,:,2) + I(:,:,3))/3);
    
    % Transform the created grey image into an 8-bit value type, 
    % in order to show in the relevant 0-255 range
    I = uint8(I);

end

%% Initialisations

% Generate the histogram X-axis array
histogramX = zeros(1,256);
for i = 0:255
    histogramX(i+1) = i;
end

% Initialise the Global Histogram
globalHistogramValues = [];

% Determine the specifications of the input image
[height,width,~] = size(I);

% Calculate how many times the window fits into the image, vertically and horizontally
verticalAmount = floor(height/windowSize);
horizontalAmount = floor(width/windowSize);


%% Find the Local Binary Pattern Histogram for each window

% Loop through each window, using the amount of times it can fit vertically and horizontally
for i = 0:(verticalAmount-1)
    for j = 0:(horizontalAmount-1)
        
        number = i*horizontalAmount + j + 1;
        if number ~= windowNumber && globalFlag == 'n'
            continue
        end
        
        % Calculate the X and Y ranges of the window
        xRange = [i*windowSize + 1 , (i+1)*windowSize];
        yRange = [j*windowSize + 1 , (j+1)*windowSize];
        
        % Create the window using these ranges
        window = I(xRange(1):xRange(2),yRange(1):yRange(2));
        
        % Calculate the Local Binary Pattern histogram of this window range
        % Using the pre-built binary histogram function
        [histogramValues,LBPWindow] = ICV_generate_binary_histogram(I,xRange,yRange);

        % Normalise the histogram
        histogramValuesNormalised = histogramValues/sum(histogramValues);
        
        % Plot the local histograms if the global flag is off
        if globalFlag == 'n'
            
            % Clear current figures
            clf
            
            % Show the connected window
            subplot(1,3,1)
            imshow(window);
            title(['Image for this Window Number ', num2str(number)])
            
            % Show the LBP Window
            subplot(1,3,2)
            imshow(LBPWindow);
            title(['LBP Window for this Window Number ', num2str(number)])
            
            % Plot the histogram
            subplot(1,3,3)
            bar(histogramX,histogramValuesNormalised)
            % Slightly larger than 0-255, in order to show nicely
            xlim([-10,265])
            ylim([0,max(0.15,max(histogramValuesNormalised))])
            xlabel('Binary Histogram Bucket')
            ylabel('Normalised binary count')
            title(['LBP Histogram for this Window Number ', num2str(number)])
            
            hFig = figure(1);
            set(hFig, 'Position', [100, 100, 1000, 500])
        
        % Store the global histograms global flag is on
        else
            
            % Store a running total of the Global Histogram values
            globalHistogramValues = [globalHistogramValues, histogramValuesNormalised];
        end
    end
end

%% Global Description

% If the global descriptor flag is on
if globalFlag == 'y'

    subplot(2,1,1)
    imshow(I);
    title('Selected Image')
    
    % Plot the global histogram values
    subplot(2,1,2)
    bar(globalHistogramValues);
    
    % Label the bar chart
    xlabel('Binary Histogram Bucket')
    ylabel('Normalised binary count')
    title('Global LBP Histogram Descriptor')

end

%% Return the global descriptor values of the global histogram

end