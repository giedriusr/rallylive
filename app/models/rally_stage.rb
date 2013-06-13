class RallyStage < ActiveRecord::Base
  belongs_to :rally, class_name: 'Rally'

  scope :passed_or_current, lambda { |number| where('number <= ?', number) }
end
