function ICV_execution_time(I,M,blockSizes,windowSizes)
%% Function to plot the execution times of varioud block and window sizes

%% Initialisations

% Initialise the times array
times = [];

%% Plot execution time for the Blocks

% If the size of provided block sizes array is larger than 1
if size(blockSizes,2) > 1

    % Loop through the provided block sizes
    for blockSize = blockSizes
        
        % Use tic-toc to time the function
        tic
        % Predict the next frame using this block size and provided window
        P = ICV_predict_next_frame(I,M,blockSize,windowSizes);
        % Record time and put into 'times' array
        time = toc;
        times = [times ; time];
    end
    
    % Plot the block sizes against these found exection times
    plot(blockSizes,times)
    % Add title and axis-labels
    title('Execution Time against Block Size')
    ylabel('Execution Time (s)')
    xlabel('Block Size')
  
end

%% Plot execution time for the Windows

% If the size of provided window sizes array is larger than 1
if size(windowSizes,2) > 1

    % Loop through the provided search window sizes
    for windowSize = windowSizes
        
        % Use tic-toc to time the function
        tic
        % Predict the next frame using this block size and provided window
        P = ICV_predict_next_frame(I,M,blockSizes,windowSize);
        % Record time and put into 'times' array
        time = toc;
        times = [times ; time];

    end
    
    % Plot the window sizes against these found exection times
    plot(windowSizes,times)
    % Add title and axis-labels
    title('Execution Time against Search Window Size')
    ylabel('Execution Time (s)')
    xlabel('Search Window Size')
    
end

%% Return void

end