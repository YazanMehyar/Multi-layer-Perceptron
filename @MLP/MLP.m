function obj = MLP(learning_Rate, num_layers)
  obj.num_layers = num_layers;
  obj.weightsCell = cell(num_layers,10);
  obj.InOutCell = zeros(num_layers,10);
  obj.learning_Rate = learning_Rate;
  for node = 1 : 10
    %bias weight is last ,Assumes 7 features
    obj.weightsCell{1, node} = randn(1,7 + 1).*0.1;
  end

  for layer = 2 : num_layers
    for node = 1 : 10
      obj.weightsCell{layer, node} = randn(1,10 + 1).*0.1;
    end
  end
  obj = class(obj, "MLP");
end