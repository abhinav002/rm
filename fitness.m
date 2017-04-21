function [p]=fitness(population,test_images_data,test_labels_data,output_labels)
  pSize=size(population,1);
  input_layer_size=size(test_images_data,2);
  for i=1:pSize
    nn_params=cell2mat(population(i,1));
    cr=cell2mat(population(i,2));
    hidden_layer_size=getNumber(cr(1,60003:60010));
    Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

    Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 output_labels, (hidden_layer_size + 1));
    pred = predict(Theta1, Theta2, test_images_data);
    v=mean(double(pred == test_labels_data)) * 100;
    population(i,3)=v;
  endfor
  p=sortCell(population);
  fprintf('\nBest fitness= %f',cell2mat(p(pSize,3)));
  min=1;max=pSize;
  for i=1:pSize
    p(i,3)= min + (max-min)*((i-1)/(pSize-1));
  endfor
endfunction