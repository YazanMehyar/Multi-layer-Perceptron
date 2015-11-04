function this = make(self, labels, predictions)
  this = self;
  if size(labels) ~= size(predictions)
    error('Number of prediction do not equal the number of labels');
  end
  for index=1:size(labels,1)
    row = find([this.confusion_matrix{:,1}] == labels(index));
    column = find([this.confusion_matrix{1,:}] == predictions(index));
    this.confusion_matrix{row,column} = this.confusion_matrix{row,column} + 1;
  end
  cMat = cell2mat(this.confusion_matrix);
  cMat(2:end,2:end) = cMat(2:end,2:end) + 1;
  cMat(1,1) = cMat(1,1) + 1;
  this.confusion_matrix = {cMat};
end