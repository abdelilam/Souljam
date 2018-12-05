class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show, :edit, :update, :delete]

  def index
  end

  def show
  end

  def new
    @instrument = Instrument.new
    @instrument.build_skill
    skill.user = current_user
    authorize @instrument

  end

  def create
    @instrument = Instrument.new(instrument_params)
    authorize @instrument
    if @instrument.save
      redirect_to dashboard_path(@user)
    else
      render :new
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def instrument_params
    params.require(:instrument).permit(:name, :category, skills_attributes: [:level])
  end
end
