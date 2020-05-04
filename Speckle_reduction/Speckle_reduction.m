clear all;
close all;
clc

%仿真相干斑抑制
addpath('test images')
addpath('codes')

%图像读取
img=imread('H.bmp');%可以更换其他
[x1,y1,z]=size(img);
if(z~=1)
    img=im2double(rgb2gray(img));
else
    img=im2double(img);
end
%滤波
L=estimate_L(img);
fprintf('滤波前等效视数为%f\n\n',L)
subplot(2,2,1);
imshow(img);
title('相干斑抑制前图像');
%增强Lee滤波
tic
I1=EnhancedLee(img);
toc
subplot(2,2,2);
imshow(I1);
title('增强Lee滤波后图像');
L1=estimate_L(I1);
fprintf('增强Lee滤波后等效视数为%f\n',L1)
EPI1=estimate_EPI(img,I1);
fprintf('增强Lee滤波后边缘保持指数为%f\n\n',EPI1)
%增强Kuan滤波
tic
I2=EnhancedKuan(img);
toc
subplot(2,2,3);
imshow(I2);
title('增强Kuan滤波后图像');
L2=estimate_L(I2);
fprintf('增强Kuan滤波后等效视数为%f\n',L2)
EPI2=estimate_EPI(img,I2);
fprintf('增强Kuan滤波后边缘保持指数为%f\n\n',EPI2)
%增强GammaMap滤波
tic
I3=EnhancedGammaMap(img);
toc
subplot(2,2,4);
imshow(I3);
title('增强GammaMap滤波后图像');
L3=estimate_L(I3);
fprintf('增强GammaMap滤波后等效视数为%f\n',L3)
EPI3=estimate_EPI(img,I3);
fprintf('增强GammaMap滤波后边缘保持指数为%f\n\n',EPI3)