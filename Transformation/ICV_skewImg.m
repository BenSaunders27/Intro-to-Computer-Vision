function skewedImg = ICV_skewImg(I,theta) 
%% Function that takes an image 'I' and horizontally skews it with angle 'theta'

%% Define the new image and get sizes

% Generate the output array using the predefined function
newArray = ICV_createOutputArray(I,ICV_skewMatrix(theta,2));

% Get the dimensions of original and output image
[height,width,channels] = size(I);
[newHeight,newWidth,~] = size(newArray);

%% Define the Skewing and Transformation Matrices

% Define the Skewing Matrix in 3 dimensions to use homogenous co-ordinates
sM = ICV_skewMatrix(theta,3);

% Define the Translation Matrix using the width difference between original and output image
widthDifference = newWidth - width;
tM = ICV_translationMatrix(0,widthDifference);

% Use Matrix Multiplication to generate the final Transformation Matrix from the Skewing and Translation Matrices
M = sM*tM;
% Calculate the inverse of the Transformation Matrix, to be applied in inverse mapping
MInv = inv(M);


%% Inverse Mapping from Output Image to Original Image

% Loop through the output image
for newi = 1:newHeight
    for newj = 1:newWidth
        % Use inverse mapping to map back to the input image
        
        % Generate Homogenous Co-ordinates for the Matrix Transformation
        newCoord = [newi; newj; 1];
        % Calculate the old coordinates through inverse mapping of the output image 
        coord = MInv * newCoord;
        
        % Find the nearest coordinate back to the original image, using nearest neghbour interpolation
        i = floor(coord(1));
        j = floor(coord(2));
        
        % Ensure the original image coordinate is found in the original image 
        if (i >= 1 && j >= 1 && i < height && j < width)
            for k = 1:channels
                % Map the pixel intensity into the output image from the coordinates of the input image
                % Define each colour channel separately
                newArray(newi, newj,k) = I(i,j,k);
            end
        end
        
    end
end
        
%% Returns the final Skewed Image

% Transform the created Output Image into an 8-bit value type, 
% in order to show in the relevant 0-255 range
skewedImg = uint8(round(newArray-1));

end
