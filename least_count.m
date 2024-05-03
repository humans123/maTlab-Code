clc
clear all
c=[2 10 4 5; 6 12 8 11;3 9 5 7];
m=size(c,1);
n=size(c,2);
a=[12 25 20];
b=[25 10 15 5];
z=0;
if sum(a)==sum(b)
    fprintf('Given transportation problem is Balanced \n');
else
     fprintf('Given transportation problem is Unbalanced \n');
     if sum(a)<sum(b)
         c(end+1,:)=zeros(1,length(b))
         a(end+1)=sum(b)-sum(a);
     else
         c(:,end+1)=zeros(length(a),1);
         b(end+1)=sum(a)-sum(b);
     end
end
X=zeros(m,n);
InitialC=c;
   for i=1:size(c,1)
       for j=1:size(c,2)
    cpq=min(c(:));
    if cpq==Inf
    break
       end
[p1,q1]=find(cpq==c)
 p=p1(1);
 q=q1(1);
X(p,q)=min(a(p),b(q));
if min(a(p),b(q))==a(p)
b(q)=b(q)-a(p);
a(p)=a(p)-X(p,q);
c(p,:)=Inf;
else
    a(p)=a(p)-b(q);
    b(q)=b(q)-X(p,q);
    c(:,q)=Inf;
end
       end
   end
for i=1:size(c,1)
    for j=1:size(c,2)
z=z+InitialC(i,j)*X(i,j);
    end
end
array2table(X)
fprintf('Transportation cost is %f \n',z);