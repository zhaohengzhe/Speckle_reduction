clear all;
close all;
clc

%������ɰ�����
addpath('test images')
addpath('codes')

%ͼ���ȡ
img=imread('H.bmp');%���Ը�������
[x1,y1,z]=size(img);
if(z~=1)
    img=im2double(rgb2gray(img));
else
    img=im2double(img);
end
%�˲�
L=estimate_L(img);
fprintf('�˲�ǰ��Ч����Ϊ%f\n\n',L)
subplot(2,2,1);
imshow(img);
title('��ɰ�����ǰͼ��');
%��ǿLee�˲�
tic
I1=EnhancedLee(img);
toc
subplot(2,2,2);
imshow(I1);
title('��ǿLee�˲���ͼ��');
L1=estimate_L(I1);
fprintf('��ǿLee�˲����Ч����Ϊ%f\n',L1)
EPI1=estimate_EPI(img,I1);
fprintf('��ǿLee�˲����Ե����ָ��Ϊ%f\n\n',EPI1)
%��ǿKuan�˲�
tic
I2=EnhancedKuan(img);
toc
subplot(2,2,3);
imshow(I2);
title('��ǿKuan�˲���ͼ��');
L2=estimate_L(I2);
fprintf('��ǿKuan�˲����Ч����Ϊ%f\n',L2)
EPI2=estimate_EPI(img,I2);
fprintf('��ǿKuan�˲����Ե����ָ��Ϊ%f\n\n',EPI2)
%��ǿGammaMap�˲�
tic
I3=EnhancedGammaMap(img);
toc
subplot(2,2,4);
imshow(I3);
title('��ǿGammaMap�˲���ͼ��');
L3=estimate_L(I3);
fprintf('��ǿGammaMap�˲����Ч����Ϊ%f\n',L3)
EPI3=estimate_EPI(img,I3);
fprintf('��ǿGammaMap�˲����Ե����ָ��Ϊ%f\n\n',EPI3)