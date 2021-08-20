a= imread('pic.jpg');% To read image from Computer
b= rgb2gray(a);% To convert color to grayscale
c= im2bw(b);% To convert grayscale to binary image
imshow (c)
