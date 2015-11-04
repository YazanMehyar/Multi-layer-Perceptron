function obj = MLP(learning_Rate, num_layers, hidden_nodes, feature_length)
  if num_layers < 2
    error('Number of layers must be at least 2');
  end
  obj.num_layers = num_layers;
  obj.hidden_nodes = hidden_nodes;
  obj.feature_length = feature_length;
  obj.output_nodes = 10;
  obj.layer_w = cell(1, num_layers);
  obj.layer_output = cell(1, num_layers);
  obj.learning_Rate = learning_Rate;

  %bias weight is last ,Assumes 7 features
  obj.layer_w{1} = randn(hidden_nodes,feature_length + 1).*0.1;

  for layer = 2 : num_layers - 1
    obj.layer_w{layer} = randn(hidden_nodes,hidden_nodes + 1) .* 0.1;
  end

  obj.layer_w{num_layers} = randn(obj.output_nodes,hidden_nodes + 1) .* 0.1;

  obj = class(obj, 'MLP');
end