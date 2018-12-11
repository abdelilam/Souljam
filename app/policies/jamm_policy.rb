class JammPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.where.not(creator_id: user)
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    if user.nil?
      false
    else
      record.creator_id == user.id
    end
  end

  def destroy?
    if user.nil?
      false
    else
      record.creator_id == user.id
    end
  end

  def dashboard?
    true
  end

  def join?
    if user.nil?
      false
    else
      record.creator_id != user.id && record.participations.where(user: user).empty? && record.capacity != record.participations.where(status: 'Accepted').size && record.date > Date.today
    end
  end

  def review?
    record.participations.joins(:reviews).where(participations: { user: user }).empty? && record.date < Date.today && !record.participations.where("user_id = ? AND status = ?", user.id, 'Accepted').empty?
  end
end
