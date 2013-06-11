class StageTimesController < ApplicationController
  before_action :set_rally
  before_action :set_stage_time, :only => [:edit, :update, :destroy, :show]

  def index
    @stage_times = RallyEventStageTime.where(:rally_id => @rally.id).order('id DESC').
    includes(:participant).includes(:stage)
    @stage_time = RallyEventStageTime.new
  end

  def new
    @stage_time = RallyEventStageTime.new
  end

  def create
    @stage_time = RallyEventStageTime.new
    if @stage_time.update_attributes(stage_time_params)
    else
      render :new
    end

    respond_to do |format|
      format.html { redirect_to rally_stage_times_path(@rally), :notice => 'Ok' }
      format.js
    end
  end

  def edit
  end

  def update
    if @stage_time.update_attributes(stage_time_params)
      redirect_to rally_stage_times_path(@rally), :notice => 'Ok'
    else
      render :edit
    end
  end

  def destroy
    @stage_time.destroy
    redirect_to rally_stage_times_path(@rally), :notice => 'Ok'
  end

  def show
  end

  private
    def set_rally
      @rally = Rally.find(params[:rally_id])
    end

    def set_stage_time
      @stage_time = RallyEventStageTime.find(params[:id])
    end

    def stage_time_params
      params.require(:rally_event_stage_time).permit(:rally_id, :stage_id, :participant_id, :stage_number,
      :time, :penalty_in_seconds)
    end
end
