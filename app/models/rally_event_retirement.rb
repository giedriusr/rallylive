class RallyEventRetirement < ActiveRecord::Base

  belongs_to :participant, class_name: 'RallyParticipant'
  belongs_to :rally, class_name: 'Rally'
  belongs_to :stage, class_name: 'RallyStage'
end
