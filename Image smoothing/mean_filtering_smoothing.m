%Dewi Kharismawati

function f = mean_filtering_smoothing(img, filter_size, position)
%img: image to be proceed
%filter_size : the mean filter size
%position: position for the subplot

[rowIMG, columnIMG] = size(img); %size of the image
average_filter = ones(filter_size); %create the demand average filter
[rowAVG, columnAVG] = size(average_filter); %size of the average filter

%Preprocessing: Zero-padding the image
N=1:rowAVG;
x=round(median(N));
imgPadding=zeros(rowIMG+2*(x-1),columnIMG+2*(x-1));

for i=x:(rowIMG+(x-1))
    for j=x:(columnIMG+(x-1))
        imgPadding(i,j)=img(i-(x-1),j-(x-1));
    end
end

% main process
sum=0;
x=0;
y=0;
for i=1:rowIMG
    for j=1:columnIMG
        for k=1:rowAVG
            for l=1:columnAVG 
                sum= sum+imgPadding(i+x,j+y)*average_filter(k,l);
                y=y+1;
            end
            y=0;
            x=x+1;
        end
        x=0;
        imgResult(i,j)=(1/(rowAVG*columnAVG))*(sum); 
        sum=0;
    end
end

subplot(3,2,position);
imshow(uint8(imgResult));
title(sprintf('result with filter size=%d', filter_size));

%return
f = imgResult;

end