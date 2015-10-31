function formatted_label = format_label(self,label)
  formatted_label = zeros(1,10);
  if label == 0
    formatted_label(10) = 1;
  else
    formatted_label(label) = 1;
  end
end