class RallyParticipant < ActiveRecord::Base
  has_many :stage_times, :class_name => RallyEventStageTime
  belongs_to :rally, :class_name => Rally

  def name
    "#{self.driver_name}, #{self.co_driver_name} - #{self.team_name}"
  end
end
