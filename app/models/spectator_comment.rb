class SpectatorComment < ActiveRecord::Base
  belongs_to :stage, class_name: 'RallyStage'
  belongs_to :rally, class_name: 'Rally'
end
