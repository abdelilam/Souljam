class JammsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @jamms = policy_scope(Jamm).where("location ILIKE ?", "%#{params[:query]}%")
    else
      @jamms = policy_scope(Jamm).order(created_at: :desc)
    end
  end

  def dashboard
    @jamms = Jamm.all.where(creator_id: current_user)
    authorize @jamms
  end

  def show
    @jamm = Jamm.find(params[:id])
    authorize @jamm
    @messages = Message.all.where(jamm_id: @jamm.id)
    @reviews = Review.joins(:participation).where(participations: { jamm_id: @jamm.id })

    @markers =
      {
        lng: @jamm.longitude,
        lat: @jamm.latitude
      }
  end

  def create
    @instruments = Instrument.joins(:skills).where(skills: {user: current_user})
    @jamm = Jamm.new(jamm_params)
    @jamm.creator_id = current_user.id
    authorize @jamm
    if @jamm.save
      redirect_to jamm_path(@jamm)
    else
      render 'new'
    end
    @participation = Participation.new
    @participation.jamm_id = @jamm.id
    @participation.user = current_user
    @participation.instrument_id = params[:jamm][:instruments]
    @participation.status = "Accepted"
    @participation.save
  end

  def new
    @jamm = Jamm.new
    authorize @jamm
    @instruments = Instrument.joins(:skills).where(skills: {user: current_user})
    redirect_to dashboard_path if @instruments.empty?
  end

  def edit
    @jamm = Jamm.find(params[:id])
    authorize @jamm
  end

  def update
    @jamm = Jamm.find(params[:id])
    @jamm.update(jamm_params)
    authorize @jamm
    if @jamm.save
      redirect_to jamm_path(@jamm)
    else
      render 'edit'
    end
  end

  def destroy
    @jamm = Jamm.find(params[:id])
    @jamm.destroy
    authorize @jamm
    redirect_to dashboard_path
  end

  private

  def jamm_params
    params.require(:jamm).permit(:title, :description, :location, :date, :capacity, :duration, :creator_id, :photo)
  end
end
