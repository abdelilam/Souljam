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
    record.creator == user
  end

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
      record.creator_id != user.id && record.participations.where(user: user).empty? && record.capacity != record.participations.where(status: 'Accepted').size
    end
  end
end
