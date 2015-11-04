function result = classify(this, sample)
  output = forward_feed(this, sample);
  [~,index] = max(output.layer_output{output.num_layers});
  if index == 10
    result = 0;
  else
    result = index;
  end
end