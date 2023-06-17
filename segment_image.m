% Assessed Coursework Mini-Project
% Method used was by firstly converting the images from RGB to Grayscale

% Secondly to improve the segmentation results of the images some filtering methods
% were used such as the imgaussfilt and medfilt2

% Another method used to help improve the results was the morphological
% operation imopen 

% The final process was performing edge detection on the images,which helps detect edges within a image.
% edges are positions in images where the image pixel value changes
% greatly in comparison to other pixels in the image

% To view the segmented images, plots of the images are displayed
% To view the accuracy of the images the mean value of the f1 scores
% was calculated



function [seg]=segment_image(I)

    I=rgb2gray(I); %Converting rgb to grayscale

    %Filtering image to remove as much noise as possible
    %Tried using built in option FilterDomain but results did not seem to
    %improve
    %Sigma of 1 produced the best result
    %Reference - https://uk.mathworks.com/help/images/ref/imgaussfilt.html
    I=imgaussfilt(I,1);
    
    %Further filtering of images using MATLAB filter medfilt2
    %Reference - https://uk.mathworks.com/help/images/ref/medfilt2.html
    I = medfilt2(I);
    

    %Cleaning filtered image processes from above using morphological
    %operation which helps with improving segmentation results  
    %imopen operation produced the best result out of all the MATLAB
    %morphological operations 
    %Reference - https://uk.mathworks.com/help/images/ref/imopen.html
    I=imopen(I,strel('disk',3,0)); 

    figure(9), clf

    %Using MATLAB built in edge detection which outputs a binary image 
    %Binary image contains 0s and 1s, 1 means there is an edge and 0 means
    %there is no edge 
    %the edge detection method that returned the best results was sobel out
    %of all the MATLAB edge detection methods.
    %Reference - https://uk.mathworks.com/help/images/ref/edge.html
    seg=edge(I, 'sobel');

    %Displays segmented images 
    imagesc(seg), colormap('gray'); axis('equal', 'tight'); colorbar
end
