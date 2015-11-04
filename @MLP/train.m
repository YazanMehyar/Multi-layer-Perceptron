function this = train(self, sample, label, iterations)
  this = self;
  errors = zeros(iterations, size(sample,1));
  for k = 1 : iterations
    for row = 1 : size(sample,1)
      this = forward_feed(this,sample(row,:));
      result = this.layer_output{this.num_layers};
      this = back_propagate(this,sample(row,:),format_label(this,label(row)), result);
      errors(k,row) = total_error(result,format_label(this,label(row)));
    end
  end
  errors = sum(errors, 2)';
  plot(1:iterations,errors);
  xlabel('Iterations');
  ylabel('Error margin');
end