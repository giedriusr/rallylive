class HomeController < ApplicationController
  before_action :set_rally

  def index
    @stage_times = RallyEventStageTime.where(:rally_id => @rally.id).order('time ASC')
  end

  def show_rally
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

  def calendar
  end

  def standings
  end

  def retirements
  end

  private
    def set_rally
      @rally = Rally.where(:is_current => true).first
    end
end
