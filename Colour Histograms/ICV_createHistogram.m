function HistogramOutput = ICV_createHistogram(I,bins)
%% Function to create the Colour Histogram, given an input image, I, and bins amount

%% Definitions 

% Calculate the height, width and channels of the input image
[height,width,channels] = size(I);

% Create an empty array the size of the bins and channels
% To be filled with the count of each intensity value
intensityCounts = zeros(bins,channels);

%% Loop through each pixel and update the intensity counts

%% For each pixel within height,width & colour channel
for i = 1:height
    for j = 1:width
        for k = 1:channels
           
            % Find the colour intensity from the pixel, normalising to 1-256
            intensity = I(i,j,k) + 1;
            % Add a count to the index of this intensity in the total count
            intensityCounts(intensity,k) = intensityCounts(intensity,k) + 1;
                   
        end
    end
end

%% Return the completed Colour Histogram

HistogramOutput = intensityCounts;

end
