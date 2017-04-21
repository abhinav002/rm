function [population]= randomPopulation(pSize,examples,features,outputLabels)
  bits=8;
  population=cell(pSize,3);
  for i=1:pSize
    cr=[];
    v=round(rand(1)*4);
    if(v>=0&&v<1)
      cr=[0 0];
      epsilon=0.125;
    elseif(v>=1&&v<2)
      cr=[0 1];
      epsilon=0.25;
    elseif(v>=2&&v<3)
      cr=[1 0];
      epsilon=0.5;
    else
      cr=[1 1];
      epsilon=1;
    endif
    var=floor(round(rand(1,examples)));
    cr=[cr var];
    hiddenUnits=floor(round(rand(1,bits)));
    cr=[cr hiddenUnits];
    hiddenUnits=getNumber(hiddenUnits);
    if(hiddenUnits==0)
      hiddenUnits=1;
      cr(1,60010)=1;
    endif
    population(i,2)=cr;
    %fprintf('Hidden units=%d\n',hiddenUnits);
    theta1=randInitializeWeights(features,hiddenUnits,epsilon);
    theta2=randInitializeWeights(hiddenUnits,outputLabels,epsilon);
    population(i,1)=[theta1(:);theta2(:)];
  endfor
endfunction