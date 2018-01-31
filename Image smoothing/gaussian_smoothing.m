function f = gaussian_smoothing(img, sigma, windowSize, position)
%img: for image to be process
%sigma: sigma ti be 
%windowSize: for different kernel
%position on subplot

%reating the gaussian kernel
%standard seviation -> sigma
[a,b]=meshgrid(-windowSize:windowSize,-windowSize:windowSize);
M = size(a,1)-1;
N = size(b,1)-1;
%kernel retrieval
kernel= exp((-(a.^2+b.^2)/(2*sigma*sigma)))/(2*pi*sigma*sigma);


%initialize for result and padding image
imgResult=zeros(size(img));
%Pad the vector with zeros
imgPadded=zeros(size(img)+(2*windowSize));

%preprocessing
for x=1:size(img,1) 
    for y=1:size(img,2)
        %padding the image with zeros based on the windowSize inputted
        imgPadded(x+windowSize,y+windowSize)=img(x,y); 
    end
end


%processing
%multiply between the image and kernel
for i = 1:size(imgPadded,1)-M
    for j =1:size(imgPadded,2)-N
        temp = imgPadded(i:i+M,j:j+M).*kernel;
        imgResult(i,j)=sum(temp(:));
    end
end

%result after the gausian filter processing
subplot(2,3,position);
imgResult = uint8(imgResult);
imshow(imgResult);
title(sprintf('RESULT sigma=%d, kernel size=%d', sigma, windowSize));

f = imgResult;

end