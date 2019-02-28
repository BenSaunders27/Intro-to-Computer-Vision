function outputImage =  ICV_rotateAndSkew(I,theta1,theta2)
%% Function that takes an image 'I' and rotates with angle 'theta1' and horizontally skews it with angle 'theta2'

%% Perform rotation if the theta1 is provided larger than 0
if theta1 > 0
    %Use the rotateImg function
    I = ICV_rotateImg(I,theta1);
end

%% Perform a skew if the theta2 is provided larger than 0
if theta2 > 0
    %Use the skewImg function
    I = ICV_skewImg(I,theta2);
end

%% Returns the final rotated and skewed image
outputImage = I;

end