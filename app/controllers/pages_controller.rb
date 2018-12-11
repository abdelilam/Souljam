class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @skills = Skill.where(user: current_user)
    # @jamms = Jamm.joins(:participations).where(participations: {user: current_user})
    @jamms = Jamm.all.where(creator_id: current_user)
    @myparts = Jamm.all.where.not(creator_id: current_user).joins(:participations).where(participations: {user: current_user, status: 'Accepted'})
    @myapplications = Jamm.joins(:participations).where(participations: {user: current_user, status: 'Pending'})
  end
end
