function nObjects = ICV_calculate_moving_objects(D)
%% Function to calculate the number of moving objects in a frame-differenced image, D

%% Initialisations

% Remove colour channels of the image - as only require spatial information
D = D(:,:,1);

% Determine the specifications of the frame differenced image
[height,width,~] = size(D);

% Initialise the number of objects count
nObjects = 0;

%% Find the count of objects by looking at each non-zero pixel

% Loop through each pixel, using the height and width
for i = 1:height
    for j = 1:width
        
        % If the pixel has already been checked or has a zero value, skip it
        if D(i,j) == 0
            continue
        end
        
        % Store the current pixel position
        currentPixel = [i,j];
        
        % Check all the pixels around in a 7x7 grid, recursively, to
        % determine the size of this object
        % Using the pre-built find complete object function 
        [D,objectSize] = ICV_find_complete_object(D,currentPixel);
        
        % If the object size is above a threshold, count this as an object
        if objectSize > 35
            % Add one to the object count
            nObjects = nObjects + 1;
        end
        
    end
end

%% Return the number of objects present in the image 

end