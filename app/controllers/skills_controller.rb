class SkillsController < ApplicationController
  def index
  end

  def new
    @skill = Skill.new
    authorize @skill
    @user = User.find(params[:id])
  end

  def create
    @instrument = Instrument.find(params[:id])
    @skill = Skill.new(skill_params)
    @skill.user = current_user
    authorize @skill
    if @skill.save
      redirect_to dashboard_path(@user)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def instrument_params
    params.require(:skill).permit(:level, instruments_attributes: [:name, :category, :icon_url])
  end
end
