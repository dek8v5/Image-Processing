%dewi kharismawati
%dek8v5 / 14231619

function f = histoEqualization(cumulative,img,position,histEqTitle)
%histoEqualization a function to equalize and normalize the image histogram
%   cumulative: histogram cummulative from histoCum
%   img: the input image
%   position: the graph position on the subplot
%   histEqTitle: histogram title on the subplot


[image_height,image_width]=size(img);

L = 256;

% calculate the probability of the gray level
Pr = zeros(1,L);
for i = 1:L
    Pr(i) = cumulative(i) / (image_height * image_width);
    S(i) = round((L-1)*Pr(i));
end


%subplot to make the graph in a figure
subplot(2,3,position);
%putting on bars
bar(S);
%putting title
title(histEqTitle);

%return to S
f = S;
end

