class RallyParticipant < ActiveRecord::Base
  has_many :stage_times, class_name: 'RallyEventStageTime', dependent: :destroy, foreign_key: :participant_id
  has_many :retirements, class_name: 'RallyEventRetirement', dependent: :destroy, foreign_key: :participant_id
  belongs_to :rally, class_name: 'Rally'

  def name
    "#{self.driver_name}, #{self.co_driver_name} - #{self.team_name}"
  end
end
