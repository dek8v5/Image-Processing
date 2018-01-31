%% Name: Dewi Kharismawati
%% dek8v5 / 14231619

%Assignment 1 CS7650

%%cleaning
clc
clear

%read the image
img = imread('Fig0310(b)(washed_out_pollen_image).tif');
%================================================================
%in case you wanna try other images
%img = imread('Fig0312(a)(kidney).tif');
%================================================================
%img = imread('Fig0309(a)(washed_out_aerial_image).tif');
%================================================================
%img = imread('Fig0323(a)(mars_moon_phobos).tif');
%================================================================
%img = imread('Fig0316(1)(top_left).tif');
%================================================================


grayImage = img;

%display the image
imshow(img);
title('Original Image');

%in case the image is not grayscale, we convert them before processing the
%height = row
%width = column
%dept = the dept of the image
[height,width,depth]=size(img);

if depth > 1
  grayImage = rgb2gray(img);
  imshow(grayImage);
end


% to make the figure full screen
histPane = figure('units','normalized','outerposition',[0 0 1 1]);

%creating the histogram from the function that has been built called histo
%histo(image name, subplot position, title)
images_histogram = histo(grayImage, 1,'Original Histogram');


%creating the original cummulative histogram
%histoCum(image_histogram (from the histogram function), subplot position, title)
cummulativeHistogram = histoCum(images_histogram, 2, 'Original Cummulative');

%%normalizing the histogram to get the qualization
%histoEqualization(cummulative, img, position, title);
S = histoEqualization(cummulativeHistogram, img, 3, 'Original Equalization');

%%after getting all the information from original images
% Assign the  values or each gray value in the images
for i = 1:height
    for j = 1:width
        grayImage(i,j)=S(grayImage(i,j)+1);
    end
end


%creating the histogram from the function that has been built called histo
%histo(image name, subplot position, title)
new_images_histogram = histo(grayImage, 4,'New Image Histogram');


%creating the original cummulative histogram
%histoCum(image_histogram (from the histogram function), subplot position, title)
new_cummulativeHistogram = histoCum(new_images_histogram, 5, 'New Image Cummulative');

%%normalizing the histogram to get the qualization
%histoEqualization(cummulative, img, position, title);
S = histoEqualization(new_cummulativeHistogram, img, 6, 'New Image Equalization');


%display the new gray image in the figure 4
figure('units','normalized','outerposition',[0 0 1 1]);
imshow(grayImage);
title('New Image');
