% Dewi Kharismawati

function f = median_filtering_smoothing(img, neighbor, position)
%img: image to be proceed
%neighborhood : neighborhood averaging mask
%position: position for the subplot

%Allocate memory for image for process and result
imgPadded=zeros(size(img)+2); 
imgResult=zeros(size(img));

%preprocessing
for x=1:size(img,1) 
    for y=1:size(img,2)
        %padding the image with zeros
        imgPadded(x+1,y+1)=img(x,y); 
    end
end

%processing the image
for i= 1:size(imgPadded,1)-(neighbor-1)
    for j=1:size(imgPadded,2)-(neighbor-1)
        %create the window
        window=zeros((neighbor)^2,1);
        index=1;
        for x=1:neighbor
            for y=1:neighbor
                %fill window with the imgPadded data
                window(index)=imgPadded(i+x-1,j+y-1);
                index=index+1;
            end
        end
        %sorting the chopped window and sort
        medianWindow=sort(window);
        %get the median value from the window array
        imgResult(i,j)=medianWindow(ceil((neighbor^2)/2));
       
    end
end
%get the normal size image with content from the windows
imgResult=uint8(imgResult);
subplot(1,4,position);
imshow(imgResult);
title(sprintf('result with neighbor mask=%d', neighbor));

%return
f = imgResult;

end
