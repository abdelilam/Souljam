class ParticipationsController < ApplicationController
  skip_after_action :verify_authorized, only: [:accept, :refuse]
  def index

  end

  def new
    @jamm = Jamm.find(params[:jamm_id])
    authorize @jamm
    @participation = Participation.new
    authorize @participation
    @instruments = Instrument.joins(:skills).where(skills: {user: current_user})
  end

  def create
    @jamm = Jamm.find(params[:jamm_id])
    authorize @jamm
    @participation = Participation.new
    @participation.jamm_id = params[:jamm_id]
    @participation.user = current_user
    @participation.instrument_id = participation_params[:instrument]
    authorize @participation
    if @participation.save
      redirect_to jamm_path(@jamm)
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @participation = Participation.find(params[:jamm_id])
    @participation.destroy
    authorize @participation
    redirect_to jamm_path(params[:id])
  end

  def accept
    @jamm = Jamm.find(Participation.find(params[:jamm_id]).jamm_id)
    @accepted_array = Participation.where(["jamm_id = ? and status = ?", @jamm.id, 'Accepted'])
    if @accepted_array.size < @jamm.capacity
      @participation = Participation.find(params[:jamm_id])
      @participation.status = 'Accepted'
      @participation.save
      redirect_to jamm_path(@participation.jamm)
    else
      "This session is full !"
    end
  end

  def refuse
      @participation = Participation.find(params[:jamm_id])
      @participation.status = 'Refused'
      @participation.save
      redirect_to jamm_path(@participation.jamm)
  end

  private

  def participation_params
    params.require(:participation).permit(:instrument)
  end
end
