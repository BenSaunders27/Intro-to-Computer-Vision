function ICV_show_moving_objects(V)
%% Function to show a Bar Plot of the Number of Moving Objects in a video

%% Definitions

% Calculate the number of frames in the video
frames = V.NumberOfFrames;

%% Loop through each frame and calculate Moving Objects

% Loop through the frames, starting at 2 so there is a reference frame
for frame = 2:frames 
    
    %% Perform Frame Differencing and Moving Object Count per frame
    
    % Read the previous frame as reference
    I = read(V,frame-1);
    
    % Read the current frame as selected
    M = read(V,frame);
    
    % Generate the frame differencing and create the differencing image
    % Using the pre-built frame differencing function
    [~, thresholdImg, ~] = ICV_frame_differencing_threshold(I,M,'n');
    
    % Calculate the number of moving objects in the frame-differenced image
    % Using the pre-built calculate moving objects function
    nObjects = ICV_calculate_moving_objects(thresholdImg);
    
    %% Present the Bar Plot of the Number of Moving Objects
    
    % Show the Bar Plot
    subplot(1,2,2)
    bar(nObjects);
    % Set the limits of the Bar Plot to 6 or nObjects, if higher 
    ylim([0,max(6,nObjects)]);
    % Set the title of the Bar Plot
    title(['Number of Moving Objects for Frame ', num2str(frame), ' - ' , num2str(nObjects), ' Object(s)'])
    xlabel('')
    ylabel('# of objects')
    
    % Show the current frame alongside the bar plot
    subplot(1,2,1)
    imshow(M);
    
end

%% Function returns void

end