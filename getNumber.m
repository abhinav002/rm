function [n]=getNumber(binary)
  n=0;
  mul=1;
  len=size(binary,2);
  for i=1:len
    n=n+mul*binary(i);
    mul=mul*2;
  endfor
endfunction