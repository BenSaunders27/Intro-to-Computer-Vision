function ICV_classfy_multiple_images(I1,I2,I3,I4,windowSize)
%% Function to classify 4 images and show

%% Classification

% Classify all 4 images
class1 = ICV_classify_image(I1,windowSize);
class2 = ICV_classify_image(I2,windowSize);
class3 = ICV_classify_image(I3,windowSize);
class4 = ICV_classify_image(I4,windowSize);

%% Plot the images with classes

% Show all 4 images with their relevant classifications
subplot(2,2,1)
imshow(I1)
title(['Image Classification:  ', class1])

subplot(2,2,2)
imshow(I2)
title(['Image Classification:  ', class2])

subplot(2,2,3)
imshow(I3)
title(['Image Classification:  ', class3])

subplot(2,2,4)
imshow(I4)
title(['Image Classification:  ', class4])

hFig = figure(1);
set(hFig, 'Position', [100, 100, 1000, 500])

end