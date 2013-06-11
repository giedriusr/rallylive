class RallyStage < ActiveRecord::Base
  belongs_to :rally, class_name: 'Rally'
end
