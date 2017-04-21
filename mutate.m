function [x]=mutate(X,pm)
  x=X;
  dim2=size(X,2);
  for i=1:2
    for j=1:dim2-1
      rnum=rand(1);
      if(rnum<=pm)
        if(x(i,j)==1)
          x(i,j)=0;
        else
          x(i,j)=1;
        endif
      endif
    endfor
  endfor
endfunction