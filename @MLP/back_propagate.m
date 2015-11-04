function this = back_propagate(self, sample, label, result)
  this = self;
  new_weights = cell(1,this.num_layers);
  %output layer
  dEdW = (repmat((label - result).*result.*(1 - result),this.hidden_nodes + 1,1) ...      %d(E)/d(result)*d(result)/d(netSum)
         .*repmat([this.layer_output{this.num_layers - 1},1]',1,this.output_nodes))'; %d(netSum)/d(weight)

  new_weights{this.num_layers} = this.learning_Rate.*dEdW + this.layer_w{this.num_layers};


  %for each hidden layer except first
  for layer = this.num_layers - 1 : -1 : 2
    dsum = sum(dEdW.*this.layer_w{layer + 1},1);
    dsum = dsum(1:this.hidden_nodes); % remove d(E)/d(Bias Weight)
    dEdW = (repmat((1 - this.layer_output{layer}).*dsum,this.hidden_nodes + 1,1)...
          .*repmat([this.layer_output{layer - 1},1]',1,this.hidden_nodes))';

    new_weights{layer} = this.learning_Rate.*dEdW + this.layer_w{layer};
    % new_weights{layer} = (this.num_layers - layer).*this.learning_Rate.*dEdW + this.layer_w{layer};
  end

  % first layer
  dsum = sum(dEdW.*this.layer_w{2},1);
  dsum = dsum(1:this.hidden_nodes); % remove d(E)/d(Bias Weight)
  dEdW = (repmat((1 - this.layer_output{1}).*dsum,7 + 1,1)...
          .*repmat([sample,1]',1,this.hidden_nodes))';
  
  new_weights{1} = this.learning_Rate.*dEdW + this.layer_w{1};
  % new_weights{1} = this.num_layers.*this.learning_Rate.*dEdW + this.layer_w{1};

  this.layer_w = new_weights;
end