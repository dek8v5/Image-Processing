% Name: Dewi Endah Kharismawati
% 14231619 / dek8v5
% Assignment 2 Digital Image Processing

clc;
clear all;
close all;

%read images, uncomment to test other images
%%======================================================================
%img = imread('Fig0312(a)(kidney).tif');
%img = imread('Fig0333(a)(test_pattern_blurring_orig).tif');
%img = imread('Fig0334(a)(hubble-original).tif');
img = imread('Fig0335(a)(ckt_board_saltpep_prob_pt05).tif');
%img = imread('Fig0338(a)(blurry_moon).tif');
%img = imread('Fig0340(a)(dipxe_text).tif');
%img = imread('Fig0333(a)(test_pattern_blurring_orig).tif');
%img = imread('Lenna.png');

%display the image
figure('units','normalized','outerposition',[0 0 0.4 1]);
subplot(3,2,1);
imshow(img);
title('Original Image');

%in case the image is not grayscale, we convert them before processing the
%height = row
%width = column
%dept = the dept of the image
grayImage = img;
[height,width,depth]=size(img);

if depth > 1
  grayImage = rgb2gray(img);
end

%%======================================================================
% MEAN SMOOTHING (AVERAGING)
% FORMAT FUNCTIONS: mean_filtering_smoothing(img, filter size)
% filter size 3
mean_filtering_smoothing(grayImage, 3, 2);
% filter size 5
mean_filtering_smoothing(grayImage, 5, 3);
% filter size 9
mean_filtering_smoothing(grayImage, 9, 4);
% filter size 15
mean_filtering_smoothing(grayImage, 15, 5);
% filter size 35
mean_filtering_smoothing(grayImage, 35, 6);

%%======================================================================
%%GAUSSIAN SMPPTHING
figure('units','normalized','outerposition',[0 0 0.8 1]);
subplot(2,3,1);
imshow(img);
title('Original Image');

%kernel size = 4, sigma 1
gaussian_smoothing(img, 1, 4, 2);

%kernel size = 4, sigma 6
gaussian_smoothing(img, 6, 4, 3);

%kernel size = 4, sigma 2
gaussian_smoothing(img, 2, 4, 4);

%kernel size = 16, sigma 2
gaussian_smoothing(img, 2, 16, 5);

%=======================================================================
%MEDIAN SMOOTHING
%format: median_filtering_smoothing(img, neighnorhood, position)

figure('units','normalized','outerposition',[0 0 0.8 0.5]);
subplot(1,4,1);
imshow(img);
title('Original Image');
%neighbor mask size = 3
median_filtering_smoothing(grayImage, 3, 2);
%neighbor mask size = 5
median_filtering_smoothing(grayImage, 5, 3);
%neighbor mask size = 9
median_filtering_smoothing(grayImage, 9, 4);
