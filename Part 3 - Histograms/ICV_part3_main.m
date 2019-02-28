function ICV_part3_main()
%% Function to run Part 3: Histogram
% The directory should be changed to the 'Part 3 - Histograms' folder and 
% the file 'ICV_part3_main' should be run. 
% This will load the 'DatasetB.avi' video and run each Histogram and 
% Intersection component in turn. The relevant plots will be printed out, 
% with the Command Window prompting a key press to move to the next plot.


% Video read in
V = VideoReader("DatasetB.avi");

%% Part A - Histogram

% Frame 200, plot the histogram
I = read(V,200);
ICV_showHistogram(I);
xlabel('Frame 200')
disp 'Frame 200 Histogram - Press enter to show the next Histogram';
pause;

% Frame 300, plot the histogram
M = read(V,300);
ICV_showHistogram(M);
xlabel('Frame 300')
disp 'Frame 300 Histogram - Press enter to move onto Histogram Intersections';
pause;


%% Part B - Histogram Intersection

% Frame 50 & 51 - non-normalised
I = read(V,50);
M = read(V,51);
ICV_showHistogramIntersection(I,M,false);
xlabel('Frames 50 & 51')
disp 'Frames 50 & 51 Histogram Intersection - Press enter to show the next Histogram Intersection';
pause;

% Frame 150 & 151 - non-normalised
I = read(V,150);
M = read(V,151);
ICV_showHistogramIntersection(I,M,false);
xlabel('Frames 150 & 151')
disp 'Frames 150 & 151 Histogram Intersection - Press enter to show the Normalised Histogram Intersection';
pause;

% Frame 50 & 51 - normalised
I = read(V,50);
M = read(V,51);
ICV_showHistogramIntersection(I,M,true);
xlabel('Frames 50 & 51 - normalised')
disp 'Frames 50 & 51 Normalised Histogram Intersection- Press enter to visualise the Tntersection Values';
pause;

% Visualise and present the intersection values - normalised
ICV_rollingIntersection(V, true)
disp 'Normalised Rolling Intersection - Press enter to finish';
pause;

close;


