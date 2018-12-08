class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @skills = Skill.where(user: current_user)
    # @jamms = Jamm.joins(:participations).where(participations: {user: current_user})
    @jamms = Jamm.all.where(creator_id: current_user)
  end
end
