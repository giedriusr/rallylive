class RalliesController < AdminController
  before_action :set_rally, :only => [:edit, :update, :destroy, :show]

  def index
    @rallies = Rally.all
  end

  def new
    @rally = Rally.new
  end

  def create
    @rally = Rally.new
    if @rally.update_attributes(rally_params)
      redirect_to rallies_path, :notice => 'Išsaugota!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @rally.update_attributes(rally_params)
      redirect_to edit_rally_path, :notice => 'Išsaugota!'
    else
      render :edit
    end
  end

  def destroy
    @rally.destroy
    redirect_to rallies_path, :notice => 'Ištrintas'
  end

  def show
  end

  private
    def set_rally
      @rally = Rally.find(params[:id])
    end

    def rally_params
      params.require(:rally).permit(:name, :description, :starts_at, :surface, :is_current, :logo)
    end
end
