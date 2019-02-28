function class = ICV_classify_image(I,windowSize)
%% Function to classify an image using global LBP comparisons

%% Initialisations

% Set the base comparison images and generate global LBP histograms

% Car Image
carI = imread("car-1.jpg");
carHistogram = ICV_LBP(carI,windowSize,'y');
% Face Image
faceI = imread("face-1.jpg");
faceHistogram = ICV_LBP(faceI,windowSize,'y');

% Compute global histogram of supplied image
suppliedHistogram = ICV_LBP(I,windowSize,'y');


%% Check similarities of supplied image to both car and face images
% Use a sum of squared errors approach

% Cars error
% Calculate differences between histograms
carDifference = (suppliedHistogram - carHistogram);
% Calculate the sum of squared errors for this comparison against the car image
carErrors = sum(carDifference.^2);


% Faces error
% Calculate differences between histograms
faceDifference = (suppliedHistogram - faceHistogram);
% Calculate the sum of squared errors for this comparison against the face image
faceErrors = sum(faceDifference.^2);


%% Calculate the final class by comparing sum of squared errors

% Compare the errors of each class and provide the class of the lowest
if carErrors < faceErrors
    class = 'Car';
else
    class = 'Face';
end

%% Return the predicted class of this image

end