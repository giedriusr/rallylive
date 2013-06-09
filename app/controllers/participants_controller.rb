class ParticipantsController < ApplicationController
  before_action :set_rally
  before_action :set_participant, :only => [:edit, :update, :destroy, :show]

  def index
    @participants = RallyParticipant.where(:rally_id => @rally.id).order('start_number ASC')
  end

  def new
    @participant = RallyParticipant.new
  end

  def create
    @participant = RallyParticipant.new
    if @participant.update_attributes(participant_params)
      redirect_to rally_participants_path(@rally), :notice => 'Ok'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @participant.update_attributes(participant_params)
      redirect_to rally_participants_path(@rally), :notice => 'Ok'
    else
      render :edit
    end
  end

  def destroy
    @participant.destroy
    redirect_to rally_participants_path(@rally), :notice => 'Ok'
  end

  def show
  end

  private
    def set_rally
      @rally = Rally.find(params[:rally_id])
    end

    def set_participant
      @participant = RallyParticipant.find(params[:id])
    end

    def participant_params
      params.require(:rally_participant).permit(:rally_id, :start_number, :driver_name,
      :co_driver_name, :team_name, :car_name, :classification, :country_code)
    end
end
