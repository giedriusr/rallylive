class HomeController < ApplicationController
  before_action :set_rally
  # caches_action :retirements, :participants, :special_stages, :calendar, :standings

  def index
    @stage_id = params[:stage_id].present? ? params[:stage_id] : nil
    @classification = params[:class].present? ? params[:class] : nil
    @time_type = params[:type].present? ? params[:type] : nil
    if @time_type == '1'
      @stage_times = RallyEventStageTime.stage_times(@rally.id, @stage_id, @classification)
    else
      @stage_times = RallyEventStageTime.final_times(@rally.id, @stage_number, @stage_id, @classification)
    end
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
      @current_stage = RallyStage.where(:is_current => true, :rally_id => @rally.id).first
      @current_active_stage_number = @current_stage.present? ? @current_stage.number : 11
      @stage_number = params[:number].present? ? params[:number] : @current_active_stage_number
    end
end
