function [D,objectSize] = ICV_find_complete_object(D,currentPixel)
%% Function to find the Complete Object that the current pixel is attached to
% Given a frame-differences image, D, and the current pixel position

%% Initialisations

% Determine the specifications of the frame differenced image
[height,width,~] = size(D);

% Initialise flag to finish checking when the whole object has been found
finishedChecking = 'n';

% Initialise the array of next pixels to check - Start with the current pixel 
% and a fake out of bounds co-ordinate, in order to correctly loop through
newPixelsToCheck = [[currentPixel(1);currentPixel(2)],[-1;-1]];

% Initialise the pixel count of this object to zero
objectSize = 0;

% Main loop to check all pixels around the current pixel in a 7x7 grid
% Find any non-zero pixels and add to a checking array
% Perform checks until all the surrounding pixels of checking pixels are zero
% Loop until no more pixels to check in this object
while finishedChecking == 'n'
    
    % Copy through the current run of pixels to check
    pixelsToCheck = newPixelsToCheck;
    % Set an array for the next run of pixels to check
    newPixelsToCheck = [];
    
    % Loop through each pixel, with an x and y co-ordinate
    for pixel = pixelsToCheck
    
        % X- and Y-Co-ordinates of the pixel 
        xCo = pixel(1);
        yCo = pixel(2);
        
        % Loop through each of the surrounding pixels of this centre pixel
        % In a 7x7 grid around the current pixel
        % Check each of these surrounding pixels
        for i = 1:7
            for j = 1:7
                
                % Calculate the co-ordinates of this checking pixel
                xCheckCo = xCo + (i-4);
                yCheckCo = yCo + (j-4);
                
                % Make sure the checking pixel co-ordinate is not out of bounds
                if xCheckCo < 1 || xCheckCo > height || yCheckCo < 1 || yCheckCo > width
                    continue
                end
                
                % If this pixel has a value, classify it as in the same object
                if D(xCheckCo,yCheckCo) > 0
                    
                    % Add one to the count of how many pixels in this object
                    objectSize = objectSize + 1;
                    
                    % Record this pixel as being checked by turning the
                    % pixel value to 0
                    D(xCheckCo,yCheckCo) = 0;
                    
                    % Add this new pixel to the array to check next
                    newPixelsToCheck = [newPixelsToCheck, [xCheckCo;yCheckCo]];
                
                end     
            end
        end 
    end
    
    % If the array of new pixels to check is empty, the whole object has
    % been found - finish checking and return from the while loop
    if size(newPixelsToCheck,1) == 0
       finishedChecking = 'y'; 
    end
    
end

%% Return the frame-differenced image, with the object size

end