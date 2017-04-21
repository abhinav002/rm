function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)

  Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

  Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));


  m = size(X, 1);
  J = 0;
  Theta1_grad = zeros(size(Theta1));
  Theta2_grad = zeros(size(Theta2));
  X = [ones(m, 1) X];
  a1=X;
  z2=X*Theta1';
  a2=sigmoid(z2);
  a2=[ones(m, 1) a2];
  z3=a2*Theta2';
  a3=sigmoid(z3);
  logisf=(-y).*log(a3)-(1-y).*log(1-a3);
  Theta1s=Theta1(:,2:end);
  Theta2s=Theta2(:,2:end);
  J=((1/m).*sum(sum(logisf)))+(lambda/(2*m)).*(sum(sum(Theta1s.^2))+sum(sum(Theta2s.^2)));


  tridelta_1=0;
  tridelta_2=0;
  delta_3=a3-y;
  z2=[ones(m,1) z2];
	delta_2=delta_3*Theta2.*sigmoidGradient(z2);
  delta_2=delta_2(:,2:end);
	tridelta_1=tridelta_1+delta_2'*a1;
  tridelta_2=tridelta_2+delta_3'*a2;
	Theta1_grad=(1/m).*tridelta_1;
  Theta2_grad=(1/m).*tridelta_2;
  grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
