class HomeController < ApplicationController
  before_action :set_rally
  def index
  end

  def participants
    @participants = RallyParticipant.where(:rally_id => @rally.id)
  end

  def start_order
    @participants = RallyParticipant.where(:rally_id => @rally.id).order('start_number ASC')
  end

  def special_stages
    @stages = RallyStage.where(:rally_id => @rally.id).order('number ASC')
  end

  private
    def set_rally
      @rally = Rally.where(:is_current => true).first
    end
end
