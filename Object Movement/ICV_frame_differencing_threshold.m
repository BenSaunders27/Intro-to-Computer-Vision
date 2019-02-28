function [D, thresholdImg, objectImg] = ICV_frame_differencing_threshold(I,M,postProcessing,T)
%% Function to perform frame differencing, given an image, M, and reference image, I
% Post processing is performed if the flag is set to 'y'
% Can provide a threshold, T, or the default is used

%% Generate the frame difference

% If the threshold hasn't been set, use default
if nargin < 4
    % Set the threshold
    T = 30;
end

% Turn the images into doubles data type, in order to allow minuses
M = double(M); I = double(I);

% Calculate the frame differencing, D, between the two images
D = M - I;

% Determine the specifications of the frame differencing
[height,width,~] = size(D);

%% Generate the object image

% Initialise the object image size
thresholdImg = zeros(size(D));
objectImg = zeros(size(D));

% Loop through each pixel, using height and width
% Keep channel constant, to ensure all colour channels are applied uniformly
for i = 1:height
    for j = 1:width
            
        % Check if the frame difference in D is above the threshold
        % Or below the minus of the threshold - For each colour channel
        if (abs(D(i,j,1)) > T || abs(D(i,j,2)) > T || abs(D(i,j,3)) > T)    
            
            % Add white to the threshold image in this position
            % Copy through the pixel values for this position into the object image
            % 
            thresholdImg(i,j,:) = [255 255 255];
            objectImg(i,j,:) = M(i,j,:);
        end 
    end
end

%% Post-processing

% If the postProcessing flag is set on
if postProcessing == 'y'
    % Loop through each pixel using height and width 
    for i = 1:height
        for j = 1:width
            
            % If the pixel position has a zero for all colour channels
            if sum(objectImg(i,j,:)) == 0
                
                % Initialise the count
                count = 0;

                % Create the 3x3 grid around the pixel
                for k = 1:3
                    for l = 1:3
                        
                        % Create the x- and y- coordinates in the grid
                        x = i-(k-2); y = j-(l-2);
                        % Check if it is out of bounds
                        if x < 1 || x > height || y < 1 || y > width
                            continue
                        end

                        % If the pixel has a value over 0
                        if sum(objectImg(x,y,:)) > 0
                            % Add 1 to the count
                            count = count + 1;
                        end 

                    end
                end

                % If the count is over half of the pixels in the grid (4) 
                if count > 4
                    % Fill in this centre pixel
                    thresholdImg(i,j,:) = [255 255 255];
                    objectImg(i,j,:) = M(i,j,:);
                end
            end
        end
    end
end


%% Return the final Object Image, Threshold Image and Frame Differenced Image

% Transform the created Threshold, Object and frame differenced Images into
% an 8-bit value type, in order to show in the relevant 0-255 range
thresholdImg = uint8(thresholdImg);
objectImg = uint8(objectImg);
D = uint8(D);

end