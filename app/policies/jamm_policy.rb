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
    record.creator_id == user.id
  end

  def destroy?
    record.creator_id == user.id
  end

  def dashboard?
    true
  end

  def join?
    record.creator_id != user.id && record.participations.where(user: user).empty?
  end
end
