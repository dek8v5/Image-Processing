% Dewi Endah Kharismawati
% dek8v5 / 14231619


function f = histo(img, position, histoTitle)
%image is the input image
%position is where the histogram will be put on display
%histoTitle is the title of histogram on display

%dimention of the image
[height,width] = size(img);

%histogram initialization
%256 is the number of bins on the histogram
images_histogram = zeros(1,256); 

%building the histogram
for i = 1:height
    for j = 1:width
        images_histogram(img(i,j)+1) = images_histogram(img(i,j)+1)+1;
    end
end

%draw the histogram on the diplay that been divided
subplot(2,3,position);
%drawing the bars
bar(images_histogram);
%accessories for the title
title(histoTitle);

%return
f = images_histogram;

end

