function convolveSum = ICV_convolve(pixels,kernel)
%% Function to calculate the convolution sum of products of a given kernel and matching pixel values


%% Dimensions and Initialisation
% Calculate the Kernel dimensions
[kerHeight,kerWidth] = size(kernel);

% Initialise Convolve Sum to zero
convolveSum = 0;

%% Calculate the sum of products

% Iterate through each matching Kernel and Pixel values position
for i = 1:kerHeight
    for j = 1:kerWidth

        % Calculate product of the values in the relevant positions
        pixelMultiply = pixels(i,j)*kernel(i,j);
        
        % Add this product to the rolling sum of products
        convolveSum = convolveSum + pixelMultiply;
        
    end
end

%% Calculate the sum of all the Kernel values

% Sum all the kernel values to normalise the sum output
kernelTotal = sum(sum(kernel));

% If this is equal to 0, must set to 1 in order to divide correctly
if kernelTotal == 0
    kernelTotal = 1;
end

%% Return the total Sum of Products, normallised by the Kernel total weight

convolveSum = convolveSum / kernelTotal;

end
