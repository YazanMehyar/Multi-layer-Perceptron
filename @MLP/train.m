function err_total = train(this, sample, label, iterations)
  for k = 1 : iterations
    for row = 1 : size(sample,1)
      result = forward_feed(this,sample(row,:));
      back_propagate(this,sample(row,:),format_label(this,label(row)), result);
      err_total(k,row) = total_error(this, result,format_label(this,label(row)));
    end
  end
  err_total = sum(err_total, 2);
  err_total = err_total';
end