function ENL=estimate_L(X)
%�����Ч����
X=X(:);
num = length(X); 
EX1 = mean(X);
EX2 = sum(X.*X)/num;
% EX2 = X'*X/num;
varX = EX2-EX1*EX1;
ENL= EX1*EX1/varX;
