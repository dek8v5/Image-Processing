%dewi kharismawati
% 14231619 / dek8v5


function f = histoCum(images_histogram, position, histCumTitle)
%histoCum is a function to build a cummulative histogram from an image
%   images_histogram: images histogram that is built from histo function
%   position: position of the histogram in subplot
%   histCumTitle: histogram title for the subplot

% Calculating the cummulative from bins histogram
cumulative = zeros(1,256);
for i = 1:256
    if i == 1
        cumulative(i) = images_histogram(i);
    else
        cumulative(i) = cumulative(i-1) + images_histogram (i);
    end
end

%subplot to make the graph in a figure
subplot(2,3,position);
%puting the cummulative histogram on bin
bar(cumulative);
%titling
title(histCumTitle);

f = cumulative;
end

