class HomeController < ApplicationController
  before_action :set_rally
  caches_action :retirements, :participants, :special_stages, :calendar, :standings

  def index
    @stage_times = RallyEventStageTime.final_times(@rally.id)
  end

  def show_rally
  end

  def participants
    @participants = RallyParticipant.where(:rally_id => @rally.id).order('start_number ASC')
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
    @retirements = RallyEventRetirement.where(:rally_id => @rally.id).includes(:participant, :stage)
  end

  private
    def set_rally
      @rally = Rally.where(:is_current => true).first
    end
end
