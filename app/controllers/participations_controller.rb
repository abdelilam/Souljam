class ParticipationsController < ApplicationController

  def index

  end

  def new
    @jamm = Jamm.find(params[:jamm_id])
    @participation = Participation.new
    authorize @participation
    @instruments = Instrument.joins(:skills).where(skills: {user: current_user})
  end

  def create
    @jamm = Jamm.find(params[:jamm_id])
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
    @oarticipation.destroy
    authorize @participation

  end

  private

  def participation_params
    params.require(:participation).permit(:instrument)
  end
end
