% Name: Dewi Endah Kharismawati
% 14231619 / dek8v5
% Assignment 2 Digital Image Processing


function f = sharpening(img, filter_mask, position, string)

%casting the image to the unit (double) that will be easier to calculate
img=double(img);


%Preallocate the matrices with zeros
imgSharpened=img;
imgResult=zeros(size(img));

%initialize imgPadded
imgPadded=zeros(size(img)+2); 

%preprocessing -> padding the initialized imgPadded
for x=1:size(img,1) 
    for y=1:size(img,2)
        %padding the image with zeros
        imgPadded(x+1,y+1)=img(x,y); 
    end
end

imgPadded=double(imgPadded); %casting to double

%Implementation of the equation
for i=1:size(imgPadded,1)-2
    for j=1:size(imgPadded,2)-2
        %implementation of the equation for filter mask 1
        imgResult(i,j)=sum(sum(filter_mask.*imgPadded(i:i+2, j:j+2)));
    end
end

%plotting filter mask 1
imgResult=uint8(imgResult);
subplot(2,3,position);
imshow(imgResult);
title(sprintf('Filtered Image with filter mask %s', string));

%Sharpenend Image from filter mask 1
finalResult=uint8(imgSharpened)-imgResult;
subplot(2,3,position+1);
imshow(finalResult);
title(sprintf('Sharpened Image with filter mask %s', string));

f = finalResult;
end
