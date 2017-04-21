function W = randInitializeWeights(L_in, L_out,epsilon)
  W = zeros(1, L_out*(1 + L_in));
  W = rand(1, L_out*(1+L_in))*2*epsilon - epsilon;
end
