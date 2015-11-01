function result = forward_feed(this, sample)
  %first layer
  a = this.layer_output{1} = logsig(sum(this.layer_w{1} .* repmat([sample,1],this.hidden_nodes,1), 2))'

  % hidden layers
  for layer = 2 : this.num_layers - 1
    b = this.layer_output{layer} = logsig(sum(this.layer_w{layer} .* repmat([this.layer_output{layer - 1},1],this.hidden_nodes,1), 2))'
  end
  % output layer applies softmax
  final_outputs = sum(this.layer_w{this.num_layers} .* repmat([this.layer_output{this.num_layers - 1},1],this.output_nodes,1), 2)';
  normalizer = sum(final_outputs);
  this.layer_output{this.num_layers} = final_outputs ./ normalizer;
  result = this.layer_output{this.num_layers}
end