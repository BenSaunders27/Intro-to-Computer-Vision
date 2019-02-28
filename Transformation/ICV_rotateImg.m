function rotatedImg = ICV_rotateImg(I,theta) 
%% Function that takes an image 'I' and rotates with angle 'theta'

%% Define the new image and get sizes

% Find the half distances of the original image, for both Y and X
[height,width,channels] = size(I);
midX = round((height+1)/2);
midY = round((width+1)/2);

% Generate the output array using the predefined function
newArray = ICV_createOutputArray(I,ICV_rotateMatrix(theta,2));

% Find the half distances of the new image, for both Y and X
[newHeight,newWidth,~] = size(newArray);
newMidX = round((newHeight+1)/2);
newMidY = round((newWidth+1)/2);


%% Define the Rotation and Transformation Matrices

% Define the first Translation Matrix to transform the image to the origin
% Homogenous coordinates so the translation can be portrayed in matrix form
tM1 = ICV_translationMatrix(-midX,-midY);

% Create the rotation matrix, using the degrees rotation provided
rM = ICV_rotateMatrix(theta,3);

% Define the second Translation Matrix to transform the output image back to its original location
tM2 = ICV_translationMatrix(newMidX,newMidY);

% Use Matrix Multiplication to generate the final Transformation Matrix from the Translation and Rotation Matrices
M = tM2*rM*tM1;
% Calculate the inverse of the Transformation Matrix, to be applied in inverse mapping
MInv = inv(M);

%% Inverse Mapping from Output Image to Original Image

% Loop through the output image Height, Width and Colour Channels
for newi = 1:newHeight
    for newj = 1:newWidth
        for k = 1:channels
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
                % Map the pixel intensity into the output image from the coordinates of the input image
                    newArray(newi, newj,k) = I(i,j,k);
                
            end
        end
    end
end
     
%% Returns the final Rotated Image

% Transform the created Output Image into an 8-bit value type, 
% in order to show in the relevant 0-255 range
rotatedImg = uint8(round(newArray-1));

end
