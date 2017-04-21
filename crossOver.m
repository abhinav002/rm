function [x]=crossOver(X,pc)
  x=X;
  dim2=size(X,2);
  rnum=rand(1);
  rlocation=round(rand(1)*(dim2-1));
  if(rnum<=pc)
    x=[X(1,1:rlocation) X(2,rlocation+1:dim2)];
    x=[x;X(2,1:rlocation) X(1,rlocation+1:dim2)];
  endif
endfunction