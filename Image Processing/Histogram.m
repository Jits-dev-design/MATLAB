close all;
clear all;
clc
I=imread('pic.jpg');% Image is loaded in I
pixels=size(I,1)*size(I,2);% Total number of pixels in the Image
imshow(I);% Display the image stored in I
title('Original Image');
figure
 
%Probability Distribution Function
Hp=uint8(zeros(size(I,1),size(I,2)));%Image is returned as a numeric array of same size as the input image I

f=zeros(256,1);% Defined Variable for Frequency and preallocated with 256 zero value to the row
pf=zeros(256,1);% Defined Variable for Probability and preallocated with 256 zero value to the row
pc=zeros(256,1);% Defined Variable for Cumulative Probability and preallocated with 256 zero value to the row
c=zeros(256,1);% Defined Variable for Cumulative and preallocated with 256 zero value to the row
out=zeros(256,1);% Defined Variable for Rounding output and preallocated with 256 zero value to the row
%For Probability
for i=1:size(I,1)% Creation of loop for rows of the Image
for j=1:size(I,2)% Creation of loop for columns of the Image
A=I(i,j);%Defined Variable for representation of the number the Grey level from 0 to 255
f(A+1)=f(A+1)+1;% nos. of pixel incremented, Since zero indexing not allowed in Matlab, the grey level 0 to 255 is mapped from 1 to 256
pf(A+1)=f(A+1)/pixels;% Finding the Probability formula
end
end
 
%Cumulative Distribution Function
sum=0;% Defined Variable Sum with value zero
for i=1:size(pf)% creation of loop
sum=sum+f(i);% Formula for calculating Cumulaitve frequency
c(i)=sum;
pc(i)=c(i)/pixels;% Formula for Cumulative Probability
out(i)=round(pc(i)*255);% Formula for calauclting the Value of L and Rounding
end
 
%Histogram equalization
for i=1:size(I,1)% Creation of loop for Rows in the Image
for j=1:size(I,2)% Creation of loop for Columns in the Image
Hp(i,j)=out(I(i,j)+1);% Replace new pixel values with the original values
end
end
imshow(Hp);
title('Histogram equalization without inbuild code');
figure

%Converting RGB image to grayscale
b=rgb2gray(I);

%Using build-in function 
J = histeq(b) ;
imshow(J) ;
title('Histogram equalization using in built code');

