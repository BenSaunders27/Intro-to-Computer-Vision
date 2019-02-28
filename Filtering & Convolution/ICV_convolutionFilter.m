function filteredImg = ICV_convolutionFilter(I,kernel)
%% Function that takes an imput image, I, performs convolution using a given kernel, and returns the resulting image


%% Determine image dimensions and generate output image structure

% Define the height, width and colour channels of the Original Image
[height,width,channels] = size(I); 

% Create the Output Image structure with the same size as the Original image 
newImage = zeros(height, width, channels);

% Define the height, width and colour channels of the Kernel
[kerHeight,kerWidth] = size(kernel); 
% Calculate the kernel half size, in order to iterate through the kernel positions
midKer = ((kerHeight - 1)/2)+1;

%% Iterate through the Input Image and apply the rolling sum using the kernel

% Iterate through height, width and channels to access every pixel
for i = 1:height
    for j = 1:width
        for k = 1:channels
            
            % For each center pixel
            
            % Pixels is a rolling mask storage of the relevant image pixels
            % to perform convolution for the kernel size
            pixels = zeros(kerHeight,kerWidth);
            
            % Iterate through each Kernel position
            for xKer = 1:kerHeight
                for yKer = 1:kerWidth
                    
                    % In order to create the kernel size around this center pixel
                    % Minus the Kernel half size from the kernel x and y
                    x = xKer - midKer;
                    y = yKer - midKer;
                    
                    % Use this Kernel amended position to find the relevant
                    % pixel in the image to make up the kernel size
                    newI = i+x;
                    newJ = j+y;
                    
                    %% Mirroring the edges
                    
                    % If pixel x-value from image outside of bounds
                    if newI < 1
                        % Mirror back into the image
                        newI = (1 - newI);
                    elseif newI > height
                        % Mirror back into the image
                        newI = (height - (newI - height));
                    end
                    
                    % If pixel y-value from image outside of bounds
                    if newJ < 1
                        % Mirror back into the image
                        newJ = (1 - newJ);
                    elseif newJ > width
                        % Mirror back into the image
                        newJ = (width - (newJ - width));
                    end 
                    
                    %% Fill out the rolling sum of products
                    
                    % Complete the pixels with the relevant Image pixel value
                    pixels(xKer,yKer) = I(newI,newJ,k);
                    
                end
            end
            
            % Convolve the image pixels with the assigned kernel, calculating the final sum of products 
            % Using the convolve function
            convolveSum = ICV_convolve(pixels,kernel);

            % Insert this Convolve Sum into the Output Image for this center pixel
            newImage(i,j,k) = convolveSum;

        end
    end
end

%% Return the final Convolution Image

% Transform the created Output Image into an 8-bit value type, 
% in order to show in the relevant 0-255 range
filteredImg = uint8(round(newImage-1));

end
