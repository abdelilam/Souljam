class SkillsController < ApplicationController
  def index
  end

  def new
    @skill = Skill.new
    authorize @skill
    @instruments = Instrument.all
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.user = current_user
    authorize @skill
    @instruments = Instrument.all

    if @skill.save
      redirect_to dashboard_path
    else
      redirect_to dashboard_path
    end
  end

  def show
    @skill = Skill.find(params[:id])

  end

  def edit
    @skill = Skill.find(params[:id])
    authorize @skill
    @instruments = Instrument.all
  end


  def update
    @skill = Skill.find(params[:id])
    @instruments = Instrument.all
    authorize @skill

    if @skill.update(skill_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    authorize @skill
    flash[:notice] = "#{@skill.instrument.name} is successfuly deleted"
    redirect_to dashboard_path
  end


  def skill_params
    params.require(:skill).permit(:level, :instrument_id)
  end
end
