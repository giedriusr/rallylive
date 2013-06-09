class StagesController < ApplicationController
  before_action :set_rally
  before_action :set_stage, :only => [:edit, :update, :destroy, :show]

  def index
    @stages = RallyStage.where(:rally_id => @rally.id).order('number ASC')
  end

  def new
    @stage = RallyStage.new
  end

  def create
    @stage = RallyStage.new
    if @stage.update_attributes(stage_params)
      redirect_to rally_stages_path(@rally), :notice => 'Ok'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @stage.update_attributes(stage_params)
      redirect_to rally_stages_path(@rally), :notice => 'Ok'
    else
      render :edit
    end
  end

  def destroy
    @stage.destroy
    redirect_to rally_stages_path(@rally), :notice => 'Ok'
  end

  def show
  end

  private
    def set_rally
      @rally = Rally.find(params[:rally_id])
    end

    def set_stage
      @stage = RallyStage.find(params[:id])
    end

    def stage_params
      params.require(:rally_stage).permit(:rally_id, :name, :length, :surface, :starts_at, :number)
    end
end
