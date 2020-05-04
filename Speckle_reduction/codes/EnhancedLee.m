function Ir=EnhancedLee(I)
%��ǿLee�˲� 
[m0,n0]=size(I);
L=estimate_L(I);

%���ڳ���ֱ�Ϊ2*r+1
r = 2;         
w = 2*r+1;
m = m0+2*r;
n = n0+2*r;

%�˲�ǰ����߽�
f = zeros(m,n); 
f(r+1:m-r,r+1:n-r) = I;
f(1:r,r+1:n-r) = I(1:r,:); %�ϱ߽�
f(m-r+1:m,r+1:n-r) = I(m0-r+1:m0,:); %�±߽�
f(r+1:m-r,1:r) = I(:,1:r); %��߽�
f(r+1:m-r,n-r+1:n) = I(:,n0-r+1:n0);%�ұ߽�
f(1:r,1:r) = I(1:r,1:r); %���Ͻ�
f(1:r,n-r+1:n) = I(1:r,n0-r+1:n0); %���Ͻ�
f(m-r+1:m,1:r) = I(m0-r+1:m0,1:r); %���½�
f(m-r+1:m,n-r+1:n) = I(m0-r+1:m0,n0-r+1:n0);%���½�

%��ǿLee�˲�
R = zeros(m,n);
f_tem=zeros(w);
c_min=1/sqrt(L);
c_max=1.732*c_min;
for j = r+1:n-r
    for i = r+1:m-r
        CP=f(i,j);
        f_tem=f(i-r:i+r,j-r:j+r);
        IMean=mean2(f_tem);
        VarY=(sum((f_tem(:)-IMean).^2))/(w^2-1);
        c_i=sqrt(VarY)/IMean;
        if c_i<c_min 
            R(i,j)=IMean;
        elseif c_i<c_max
            VarZ=VarY/IMean.^2;
            K=(VarY-VarZ*(IMean.^2))/(VarY*(1+VarZ));
            R(i,j)=IMean+K*(CP-IMean);
        else
            R(i,j)=CP;
        end
    end
end

Ir=R(r+1:m-r,r+1:n-r);