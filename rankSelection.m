function [x]=rankSelection(X)
  psize=size(X,1);
  dim2=size(X,2);
  fsum=sum(cell2mat(X(:,dim2)));
  rnum=rand(1)*fsum;
  vsum=0;
  index=0;
  flag=true;
  while(index<psize&&flag)
    vsum=vsum+cell2mat(X(index+1,dim2));
    if(vsum>=rnum)
      flag=false;
    endif
    index=index+1;
  endwhile
  x=cell2mat(X(index,2));
  
  rnum=rand(1)*fsum;
  vsum=0;
  index=0;
  flag=true;
  while(index<psize&&flag)
    vsum=vsum+cell2mat(X(index+1,dim2));
    if(vsum>=rnum)
      flag=false;
    endif
    index=index+1;
  endwhile
  x=[x;cell2mat(X(index,2))];
endfunction