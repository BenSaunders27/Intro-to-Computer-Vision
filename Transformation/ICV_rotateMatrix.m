function rM = ICV_rotateMatrix(theta,dimensions)
%% Function to generate a Rotation Matrix for a certain theta in a certain dimension

%Use the minus of theta to ensure the rotation is performed clockwise
theta = -theta;

% Create the 2-D Matrix
if dimensions == 2
    % Use the Rotation Matrix formula which includes Cos(theta) and Sin(theta)
    rM = [ cosd(theta) , -sind(theta) ; 
        sind(theta) , cosd(theta)];
    
% Create the 3-D Matrix using homogenous co-ordinates
elseif dimensions == 3
    % Extra dimensions for homogenous co-ordinates
    rM = [ cosd(theta) , -sind(theta), 0;
        sind(theta) , cosd(theta), 0;
        0         ,      0        ,  1];
end

%% Returns the Rotation Matrix as rM 

end