function [t]=sortCell(population)
  [dim1 dim2]=size(population);
  t=cell(dim1,dim2);
  var=[];
  index=0;
  for i=1:dim1
    var=[var;cell2mat(population(i,3)) i];
  endfor
  var=sortrows(var,1);
  for i=1:dim1
    t(i,3)=var(i,1);
    index=floor(var(i,2));
    t(i,1)=cell2mat(population(index,1));
    t(i,2)=cell2mat(population(index,2));
  endfor
endfunction