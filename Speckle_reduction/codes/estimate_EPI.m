function EPI=estimate_EPI(img_before,img_after)
% 计算图像边缘保持指数EPI
[height,width]=size(img_before);
sum_before=0;
%去噪前 
for j=1:width-1
    for i=1:height-1 
        sum_before=sum_before+sqrt((img_before(i,j)-img_before(i+1,j)).^2+(img_before(i,j)-img_before(i,j+1)).^2);
    end
end
sum_after=0;
%去噪后
for j=1:width-1
    for i=1:height-1 
        sum_after=sum_after+sqrt((img_after(i,j)-img_after(i+1,j)).^2+(img_after(i,j)-img_after(i,j+1)).^2);
    end
end
EPI=sum_after/sum_before;