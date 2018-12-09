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

  def destroy?
    record.creator == user
  end

  def dashboard?
    true
  end
end
