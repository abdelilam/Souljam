class ParticipationsController < ApplicationController
  before_action :find_jam, only: [:new, :create, :update, :edit, :destroy]
  before_action :participant, only: [:update, :destroy]
  before_action :current_participant, only: [:create, :update, :destroy]
  before_action :user_instruments, only: [:update, :destroy]

  def index
  end

  def new
  end

  def create
    if @jamm.user == current_user
      @participant = Participation.new(jamm_id: @jamm.id, user: nil, instrument_id: params[:participant][:instrument_id])
    else
      @participant = Participation.new(jamm_id: @jamm.id, user: current_user, instrument_id: params[:participation][:instrument_id])
  end

    if @participant_current.empty?
      @participant.save
      redirect_to @jamm
    else
      redirect_to @jamm, alert: "You have already joined this Jam session :)"

    end
    authorize @participant
  end

  def show
  end

  def edit
  end

  def update
    if@participant.user == nil && @participation_current.empty?
      @participant.user = current_user
      @participant.save
      redirect_to @jamm
    elsif participant.user != nil
      participant.user = nil
      @participant.save
      redirect_to @jamm
    else
      redirect_to @jamm, alert: "You have already joined this jam session :)"
    end
    authorize @participant
  end

  def destroy
    @participant.destroy
    redirect_to @jamm
    authorize @participant
  end
   private

  def current_participant
    @participant_current = Participation.where(jamm_id: @jamm.id, user_id: current_user.id)
  end

  def user_instruments
    @instruments = Instrument.where(user_id: current_user)
  end

  def find_jam
    @jamm = Jamm.find(params[:jamm_id])
  end

  def participant
    @participant = Participation.find(params[:id])
  end

  def participation_params
    params.require(:participation).permit(:status)
  end
end
