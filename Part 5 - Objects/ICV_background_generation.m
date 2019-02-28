function backgroundImg = ICV_background_generation(V)
%% Function to generate a background reference frame from a video

%% Initialisations

% Provide a threshold for frame differencing - use a lower threshold for
% the background, to avoid classing an object as background
T = 2;

% Calculate the number of frames in the video
frames = V.NumberOfFrames;

% Determine the specifications of the frame differencing image
[height,width,channels] = size(read(V,1));

% Initialise the background image as zeros equal size of the frames
backgroundImg = double(zeros(height,width,channels));

% Initialise a count of how many times each pixel position has been updated
backgroundCount = zeros(height,width);

%% For each frame, add information to the background image

% Loop through the frames, looking at only the 5th frame in the sequence
% For computational efficiency
for frameIndex = 1:round(frames/5)
    
    % Extrapolate this index out to each 5th frame
    frameIndex5 = frameIndex*5;
    
    % Read the previous frame 
    I = read(V,frameIndex5-1);
    
    % Read the current frame
    M = read(V,frameIndex5);
    
    % Generate the frame differencing and create the differencing image
    % Using the pre-built frame differencing function
    [~, thresholdImg, ~] = ICV_frame_differencing_threshold(I,M,'n',T);
    
    % Loop through each pixel in the object image
    for i = 1:height
        for j = 1:width
            
            % Not an object
            if sum(thresholdImg(i,j,:)) == 0
            
                % Add this pixel value to the total sum for this pixel over all images
                backgroundImg(i,j,:) = backgroundImg(i,j,:) + double(M(i,j,:));
                
                % Add 1 to the count for this pixel - to average at the end
                backgroundCount(i,j) = backgroundCount(i,j) + 1;
                
            end
        end
    end 
end

%% Calculate the weighted averaged values of the background

% Loop through each pixel
for i = 1:height
    for j = 1:width
                
        % Divide the total value by the count of frames that provided this
        % background information - to perform a weighted averaging
        backgroundImg(i,j,:) = backgroundImg(i,j,:) / backgroundCount(i,j);
    
    end
end

%% Return the final background image

% Transform the created Background Image into an 8-bit value type, 
% in order to show in the relevant 0-255 range
backgroundImg = uint8(backgroundImg);

end