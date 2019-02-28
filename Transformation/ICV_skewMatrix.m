function sM = ICV_skewMatrix(theta,dimensions)
%% Function to generate a Skewing Matrix for a certain theta in a certain dimension

% Initialise theta to 90degrees minus given theta
% Creates a skewing from the current 90degrees position
theta = 90 - theta;

% Create the 2-D Matrix
if dimensions == 2
    % Use the Skewing Formula which contains -tan(theta) in order to shift the top of the image clockwise
    sM = [ 1               , 0 ;
          -1/(tand(theta)) , 1];

% Create the 3-D Matrix using homogenous co-ordinates
elseif dimensions == 3
    sM = [ 1               , 0 , 0  ;
          -1/(tand(theta)) , 1 , 0  ;
           0               , 0 , 1 ];
end

%% Returns the Skewing Matrix, sM

end