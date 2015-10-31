function back_propagate(this, sample, label, result)
  new_weights = cell(this.num_layers,10);
  dWeight = cell(this.num_layers,10);
  %output layer
  for node = 1 : 10
    dWeight{this.num_layers,node} = (1 - result(node))*(label(node) - result(node))*this.InOutCell(this.num_layers - 1,:);
    dWeight{this.num_layers, node}(11) = (1 - result(node))*(label(node) - result(node))*1;
    new_weights{this.num_layers,node} = this.learning_Rate*dWeight{this.num_layers,node} + this.weightsCell{this.num_layers,node};
    % the bias weight update
    % new_weights{this.num_layers,node}(11) = this.learning_Rate*dWeight{this.num_layers, node}(11) + this.weightsCell{this.num_layers,node}(11);
  end

  %for each hidden layer
  for layer = this.num_layers - 1 : -1 : 2
    for node = 1 : 10
      dsum = 0;
      for dDependence = 1:10
        dsum = dsum + dWeight{layer+1,dDependence}(node) * this.weightsCell{layer+1, dDependence}(node);
      end
      dWeight{layer,node} = (1 - this.InOutCell(layer,node))*this.InOutCell(layer - 1,:)*dsum;
      dWeight{layer, node}(11) = (1 - this.InOutCell(layer,node))*dsum;
      new_weights{layer,node} = this.learning_Rate*dWeight{layer,node} + this.weightsCell{layer,node};
      % the bias weight update
      % new_weights{layer,node}(11) = this.learning_Rate*dWeight{layer, node}(11) + this.weightsCell{layer,node}(11);
    end
  end

  % first layer
  for node = 1 : 10
    dsum = 0;
    for dDependence = 1:10
      dsum = dsum + dWeight{2,dDependence}(node) * this.weightsCell{2, dDependence}(node);
    end
    dWeight{1,node} = (1 - this.InOutCell(1,node))*sample*dsum;
    dWeight{1, node}(8) = (1 - this.InOutCell(1,node))*dsum;
    new_weights{1,node} = this.learning_Rate*dWeight{1,node} + this.weightsCell{1,node};
    % the bias weight update
    % new_weights{1,node}(8) = this.learning_Rate*dWeight{1, node}(8) + this.weightsCell{1,node}(8);
  end

  this.weightsCell = new_weights;
end