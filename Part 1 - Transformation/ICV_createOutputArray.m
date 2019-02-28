function newArray = ICV_createOutputArray(I,M)
%% Function to generate the structure of an image, I, multiplied by the Matrix, M 

%% Initialise size and properties of the input image

% Calculate the dimensions of the input image
[height,width,~] = size(I);

% Find the corners of the image, as these are important for the rotated image size
A = [1 ; 1]; % Top left
B = [1 ; width]; % Top Right
C = [height ; width]; % Bottom Right
D = [height;1]; % Bottom Left

%% Find the output image dimensions from transforms corners

% Transform each of the corner pixels by the given Matrix, to calculate corners of the output image
nA = M * A;
nB = M * B;
nC = M * C;
nD = M * D;

% Find the max and min values of X and Y found in these output image corners
maxX = max([nA(1), nB(1) , nC(1) , nD(1)]);
minX = min([nA(1), nB(1) , nC(1) , nD(1)]);
maxY = max([nA(2), nB(2) , nC(2) , nD(2)]);
minY = min([nA(2), nB(2) , nC(2) , nD(2)]);

% Calculate the final dimensions of the output image
xSize = round(maxX - minX);
ySize = round(maxY - minY);

%% Return the new output image structure, in 3 colour channels

newArray = zeros(xSize,ySize,3); 

end











