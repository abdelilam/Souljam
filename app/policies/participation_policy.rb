class ParticipationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    false
  end

  def update?
    false
  end

  def destroy?
    is_user?
  end

  private

  def is_user?
    record.user == user
  end
end
