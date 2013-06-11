class RetirementsController < AdminController
  before_action :set_rally
  before_action :set_retirement, :only => [:edit, :update, :destroy, :show]

  def index
    @retirements = RallyEventRetirement.where(:rally_id => @rally.id).includes(:participant, :stage)
  end

  def new
    @retirement = RallyEventRetirement.new
  end

  def create
    @retirement = RallyEventRetirement.new
    if @retirement.update_attributes(retirement_params)
      redirect_to rally_retirements_path(@rally), :notice => 'Ok'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @retirement.update_attributes(retirement_params)
      redirect_to rally_retirements_path(@rally), :notice => 'Ok'
    else
      render :edit
    end
  end

  def destroy
    @retirement.destroy
    redirect_to rally_retirements_path(@rally), :notice => 'Ok'
  end

  def show
  end

  private
    def set_rally
      @rally = Rally.find(params[:rally_id])
    end

    def set_retirement
      @retirement = RallyEventRetirement.find(params[:id])
    end

    def retirement_params
      params.require(:rally_event_retirement).permit(:rally_id, :participant_id, :stage_id, :reason)
    end
end
