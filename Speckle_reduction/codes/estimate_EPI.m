function EPI=estimate_EPI(img_before,img_after)
% ����ͼ���Ե����ָ��EPI
[height,width]=size(img_before);
sum_before=0;
%ȥ��ǰ 
for j=1:width-1
    for i=1:height-1 
        sum_before=sum_before+sqrt((img_before(i,j)-img_before(i+1,j)).^2+(img_before(i,j)-img_before(i,j+1)).^2);
    end
end
sum_after=0;
%ȥ���
for j=1:width-1
    for i=1:height-1 
        sum_after=sum_after+sqrt((img_after(i,j)-img_after(i+1,j)).^2+(img_after(i,j)-img_after(i,j+1)).^2);
    end
end
EPI=sum_after/sum_before;