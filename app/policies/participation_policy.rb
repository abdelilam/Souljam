class ParticipationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    false
  end

  def destroy?
    is_user? && record.jamm.creator_id != user.id
  end

  private

  def is_user?
    record.user == user
  end
end
