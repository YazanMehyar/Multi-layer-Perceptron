function obj = ConfusionMatrix(varargin)
  obj.num_of_classes = length(varargin);
  obj.confusion_matrix = cell(1 + obj.num_of_classes);
  obj.confusion_matrix(:,:) = {-1};
  obj.confusion_matrix(1,2:obj.num_of_classes + 1) = varargin;
  obj.confusion_matrix(2:obj.num_of_classes + 1,1) = varargin;

  obj = class(obj,'ConfusionMatrix');
end