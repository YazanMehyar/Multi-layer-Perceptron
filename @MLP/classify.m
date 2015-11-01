function result = classify(this, sample)
  [~,index] = max(forward_feed(this, sample));
  if index == 10
    result = 0;
  else
    result = index;
  end
end