function result = forward_feed(this, sample)
  %first layer
  for node = 1 : 10
    this.InOutCell(1,node) = logsig(sum(this.weightsCell{1,node} .* [sample,1]));
  end

  % hidden layers and output
  for layer = 2 : this.num_layers
    for node = 1 : 10
      this.InOutCell(layer,node) = logsig(sum(this.weightsCell{layer,node} .* [this.InOutCell(layer - 1,:),1]));
    end
  end

  result = this.InOutCell(this.num_layers,:)
end