function final(m,solution,test_images_data,test_labels_data)
  rp = randperm(10000);
  pSize=size(solution,1);
  cr=cell2mat(solution(pSize,2));
  hidden_layer_size=getNumber(cr(1,60003:60010));
  input_layer_size=size(test_images_data,2);
  output_labels=10;
  nn_params=cell2mat(solution(pSize,1));
  Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));
  Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 output_labels, (hidden_layer_size + 1));
  for i = 1:m
    % Display 
    %fprintf('\nDisplaying Example Image\n');
    displayData(test_images_data(rp(i), :));

    pred = predict(Theta1, Theta2, test_images_data(rp(i),:));
    var=test_labels_data(rp(i));
    fprintf('\nNeural Network Prediction: %d (Actual %d)\n', pred, test_labels_data(rp(i)));
    
    % Pause
    %fprintf('Program paused. Press enter to continue.\n');
    %pause;
  end
endfunction