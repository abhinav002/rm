function [x]=getEpsilon(binary)
  if(isequal(binary,[0 0]))
    x=0.125;
  elseif(isequal(binary,[0 1]))
    x=0.25;
  elseif(isequal(binary,[1 0]))
    x=0.5;
  else
    x=1;
  endif
endfunction