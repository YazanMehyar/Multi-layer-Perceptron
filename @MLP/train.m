function errors = train(this, sample, label, iterations)
  errors = zeros(iterations, size(sample,1));
  for k = 1 : iterations
    for row = 1 : size(sample,1)
      result = forward_feed(this,sample(row,:));
      back_propagate(this,sample(row,:),format_label(this,label(row)), result);
      errors(k,row) = total_error(this, result,format_label(this,label(row)));
    end
  end
  errors = sum(errors, 2)';
end