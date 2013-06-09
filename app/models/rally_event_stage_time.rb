class RallyEventStageTime < ActiveRecord::Base
  # attr_accessible :rally_id, :stage_id, :participant_id, :stage_number, :time
  belongs_to :rally, :class_name => Rally
  belongs_to :participant, :class_name => RallyParticipant
  belongs_to :stage, :class_name => RallyStage
end
