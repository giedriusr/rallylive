class Rally < ActiveRecord::Base
  mount_uploader :logo, RallyUploader

  has_many :stages, :class_name => RallyStage, :dependent => :destroy
  has_many :participants, :class_name => RallyParticipant, :dependent => :destroy
  has_many :stage_times, :class_name => RallyEventStageTime, :dependent => :destroy

  def length
    total = 0.0
    stages.each do |stage|
      total += stage.length
    end
    total
  end
end
