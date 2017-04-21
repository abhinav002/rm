function [Y]=trainLabels(labels,output_labels)
  m=length(labels);
  Y=zeros(m,output_labels);
  for i=1:m
    var=labels(i);
    if(var==0)
      Y(i,10)=1;
    else
      Y(i,var)=1;
    endif
  endfor
endfunction