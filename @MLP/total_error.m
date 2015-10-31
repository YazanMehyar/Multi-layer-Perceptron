function errors = total_error(this, result, label)
  errors = sum((result - label).^2);
end