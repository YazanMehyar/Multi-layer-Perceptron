% Configure the label to match output of the MLP
%
% FORMAT_LABEL( MLP object, label )
%
% Returns: formatted label
%
% NOTE The formatted label is a 1x10 vector where the all the elements are 0
%      except for the index matching the label
%     eg. 3 --> [0 0 1 0 0 0 0 0 0 0]
%         0 --> [0 0 0 0 0 0 0 0 0 1]
%
%
function formatted_label = format_label(self,label)
  formatted_label = zeros(1,10);
  if label == 0
    formatted_label(10) = 1;
  else
    formatted_label(label) = 1;
  end
end