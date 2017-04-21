  
  pSize=size(solution,1);
  fprintf('\n');
  for i=1:pSize
    cr=cell2mat(population(i,2));
    fprintf('No:%d | ',i);
    fprintf('Number of examples used=%d | ',sum(cr(1,3:60002)));
    fprintf('Number of hidden units=%d\n',getNumber(cr(1,60003:60010)));
  endfor
