function [histogramValues,LBPWindow] = ICV_generate_binary_histogram(I,xRangeWindow,yRangeWindow)
%% Function to generate an LBP image and binary histogram from a given window range

%% Initialisations

% Initialise the final histogram values vector
histogramValues = zeros(1,256);

% Determine the specifications of the window
[height,width,~] = size(I);

% Initialise the LBP Image the same size of the full image
LBPimage = zeros(height,width);

%% Calculate each binary value of each possible block

% Loop through each pixel of the window
for i = xRangeWindow(1):xRangeWindow(2)
    for j = yRangeWindow(1):yRangeWindow(2)
        
        % Find the range of the 3x3 patch around this pixel
        % Put this in a patch array
        xRangePatch = [i-1 , i, i+1];
        yRangePatch = [j-1 , j, j+1];
        
        %% Create the LBP Block
        
        % Initialise the lbpBlock
        lbpBlock = zeros(3,3);
        
        % Generate the LBP Block using the range provided
        for newI = 1:3
            for newJ = 1:3
                
                % Find the patch coordinates from the patch array
                patchI = xRangePatch(newI);
                patchJ = yRangePatch(newJ);
                
                % Mirror the pixels if out of bounds
                
                % If LBP pixel outside of image bounds, mirror
                if patchI < 1
                    patchI = (1 - patchI);
                elseif patchI > height
                    patchI = (height - (patchI - height));
                end

                % If LBP pixel outside of image bounds, mirror
                if patchJ < 1
                    patchJ = (1 - patchJ);
                elseif patchJ > width
                    patchJ = (width - (patchJ - width));
                end
            
                % Set the value of this pixel to be from the image
                lbpBlock(newI,newJ) = I(patchI,patchJ);
                
            end
        end
        
        
        % Find binary value from this LBP block
        % Using the pre-built binary pattern function
        binaryValue = ICV_generate_binary_pattern(lbpBlock);
        
        % Add one to this histogram bucket - store them as the one above
        % the value - as the value could be 0
        histogramValues(binaryValue+1) = histogramValues(binaryValue+1) + 1;
        
        % Add this binary value to the correct position in the LBP Image output
        LBPimage(i,j) = binaryValue; 
        
    end
end  

%% Generate the LBP Window

% Create the window patch of this LBP Image
LBPWindow = LBPimage(xRangeWindow(1):xRangeWindow(2),yRangeWindow(1):yRangeWindow(2));

% Transform the LBP Window back to a 8-bit int
LBPWindow = uint8(LBPWindow);

%% Return the histogram values and LBP Image of this window

end


