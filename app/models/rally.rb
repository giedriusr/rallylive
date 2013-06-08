class Rally < ActiveRecord::Base
  mount_uploader :logo, RallyUploader

  has_many :stages, :class_name => RallyStage, :dependent => :destroy
end
